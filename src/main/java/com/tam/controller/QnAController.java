package com.tam.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tam.model.Criteria;
import com.tam.model.MemberVO;
import com.tam.model.PageMakerDTO;
import com.tam.model.QnaVO;
import com.tam.service.QnAService;

@Controller
@RequestMapping("/qna/*")
public class QnAController {

	private static final Logger log = LoggerFactory.getLogger(QnAController.class);

	@Autowired
	private QnAService qnaService;

	@Autowired
	BCryptPasswordEncoder pwEncoder;
	/*
	 * @GetMapping("/main") public void mainQnAGET(Model model) throws Exception{
	 * log.info("Q&A 메인페이지 진입"); List<QnaVO> aVo = qnaService.selectAll(2);
	 * model.addAttribute("qlist", qnaService.selectAll(2)); }
	 */

	@GetMapping("/postQnA")
	public void postQnAGET(Model model, int prodNum, HttpSession session) {
		log.info("등록 페이지 진입");
		MemberVO lvo = (MemberVO) session.getAttribute("member");
		model.addAttribute("prodNum", prodNum);
		model.addAttribute("id", lvo.getId());
	}

	@PostMapping("/postQnA")
	@ResponseBody
	public String postQnAPOST(QnaVO qVo, RedirectAttributes rttr) throws Exception {
		log.info("상품등록 " + qVo);
		qnaService.postQnA(qVo);
		return "result";
	}

	@GetMapping("/showQnA")
	public void showQnAGET(int qnaNum, Model model, Criteria cri) throws Exception {
		log.info("상세보기 진입");
		model.addAttribute("pageInfo", qnaService.selectOne(qnaNum));
		model.addAttribute("cri", cri);
	}

	@GetMapping("/updateQnA")
	public void updateQnAGET(int qNum, Model model) throws Exception {
		log.info("수정하기 페이지 진입");
		model.addAttribute("pageInfo", qnaService.selectOne(qNum));
	}

	// 게시판 수정
	@PostMapping("/updateQ")
	@ResponseBody
	public String updateQPOST(QnaVO qVo, RedirectAttributes rttr) throws Exception {
		log.info(qVo.getQnaStatus());
		qnaService.updateQ(qVo);
		rttr.addFlashAttribute("result", "수정 성공");
		return "redirect:/qna/main";
	}

	// 목록 삭제
	@PostMapping("/deleteQ")
	@ResponseBody
	public String deleteQPOST(int qnaNum, RedirectAttributes rttr) throws Exception {
		qnaService.deleteQ(qnaNum);
		rttr.addFlashAttribute("result", "삭제 성공");
		return "result";
	}

	// 게시판 수정
	@PostMapping("/updateA")
	@ResponseBody
	public String updateAPOST(QnaVO qVo, RedirectAttributes rttr) throws Exception {
		log.info(qVo.getQnaStatus());
		qnaService.updateA(qVo);
		rttr.addFlashAttribute("result", "수정 성공");
		return "redirect:/qna/main";
	}

	// 목록 삭제
	@PostMapping("/deleteA")
	@ResponseBody
	public String deleteAPOST(QnaVO qVo, RedirectAttributes rttr) throws Exception {
		qnaService.deleteA(qVo);
		rttr.addFlashAttribute("result", "삭제 성공");
		return "result";
	}

}
