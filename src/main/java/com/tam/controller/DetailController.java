package com.tam.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tam.model.MemberVO;
import com.tam.model.ProductVO;
import com.tam.model.QnaVO;
import com.tam.service.LoginService;
import com.tam.service.ProdDetailService;
import com.tam.service.QnAService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/detail")
@Log4j
public class DetailController {
	
	@Autowired
	private ProdDetailService pdService;
	
	@Autowired
	private QnAService qaService;
	
	@Autowired
	private LoginService lService;
	
	@GetMapping("/cosmeticDetail/{prodNum}")
	public String cosmeticDetailGET(@PathVariable("prodNum") int prodNum, Model model, MemberVO member, HttpServletRequest request) throws Exception {
		
		log.info("상품 상세페이지 이동");
		
//		HttpSession session = request.getSession();		// 세션 생성
//		MemberVO mVo = lService.adminCk(member);
//		mVo.getAdminCk();
		
		// 상품 번호로 상세정보 조회
		ProductVO prodDetail = pdService.getProdDetail(prodNum);
		log.info(prodDetail);
		
		// 상품 상세정보 데이터 전송
		model.addAttribute("qnaList",qaService.selectAll(prodNum));
		model.addAttribute("prodDetail", prodDetail);
		return "/detail/cosmeticDetail";
	}

}
