package com.tam.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tam.model.Criteria;
import com.tam.model.MemberVO;
import com.tam.model.Order2DTO;
import com.tam.model.OrderDetailDTO;
import com.tam.model.OrderPageDTO;
import com.tam.model.OrderPageItemDTO;
import com.tam.model.PageMakerDTO;
import com.tam.model.ProductVO;
import com.tam.service.UserOrderService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/userOrder")
@Log4j
public class UserOrderController {
	
	@Autowired
	private UserOrderService uoService;
	
	/* 주문 페이지 이동 */
	@GetMapping("/order/{id}")
	public String orderPageGET(@PathVariable String id, OrderPageDTO odp, Model model) {
		log.info("주문 페이지 이동");	
		System.out.println("id: " + id);
		System.out.println("orders: " + odp.getOrders());
		List<OrderPageItemDTO> list = uoService.prodInfo(odp.getOrders());
		model.addAttribute("prodCount", list.size());
		model.addAttribute("orderList", list);
		model.addAttribute("memberInfo", uoService.userInfo(id));
		model.addAttribute("point", uoService.userPoint(id));		
		
		return "/userOrder/orderPage";	
	}
	
	/* 주문 실행 */
	@PostMapping("/order")
	public String orderPagePOST(Order2DTO od, HttpServletRequest request) {
		System.out.println("od: " + od);
		uoService.order(od);
		return "redirect:/userOrder/myOrder";
//		return null;
	}
	
	/* 마이 페이지 - 내 주문 목록 이동 */
	// 내 주문 페이지 이동
	@GetMapping("/myOrder")
	public String myOrderPageGET(Criteria cri, Model model, HttpServletRequest request) {
		// 회원 아이디
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		String id = vo.getId();
		cri.setId(id);
		List<Order2DTO> list = uoService.myOrderList(cri);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", new PageMakerDTO(cri, uoService.myOrderTotal(cri)));
		}else {
			model.addAttribute("listCheck", "empty");
		}
		log.info("주문내역 페이지 진입");
		return "/userOrder/myOrder";
	}
	
	// 내 주문 상세 페이지 이동
	@GetMapping("/myOrderDetail/{orderNum}")
	public String myOrderDetailPageGET(@PathVariable int orderNum, Model model) {
		List<OrderDetailDTO> list = uoService.myOrderDetail(orderNum);
		Order2DTO dto = uoService.myOrder(orderNum);
		model.addAttribute("detail", list);
		model.addAttribute("order", dto);
		log.info("주문 상세 페이지 진입");
		return "/userOrder/myOrderDetail";
	}
	
	// 주문 취소처리
	@GetMapping("/cancelOrder/{orderNum}")
	public String cancelMyOrder(@PathVariable int orderNum) {
		uoService.cancelMyOrder(orderNum);
		return "redirect:/userOrder/myOrder";
	}

}
