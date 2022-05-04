package com.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.domain.InquiryVO;
import com.board.service.BoardService;
import com.common.service.CommonService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/board/")
public class BoardController {
		@Autowired
	private BoardService boardService;
	@GetMapping("notice")
	public void notice() {
		System.out.println("공지사항 폼 요청!");
		
	}
	
	@GetMapping("inquiry")
	public void inquiry() {
		
		System.out.println("1대1 문의하기 폼 요청 ");
	}
	
	@PostMapping("inquiryPro")
	public void inquiryPro(InquiryVO vo, Model model,HttpSession session) {
		
		String id = (String)session.getAttribute("memId");
				
				vo.setId(id);
				
		int result = boardService.addInq(vo);
		
		model.addAttribute("result",result);
		
			
		
			
		
	}
}
