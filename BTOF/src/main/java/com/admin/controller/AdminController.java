package com.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.admin.domain.Criteria;
import com.admin.domain.PageDTO;
import com.admin.domain.ProductVO;
import com.admin.service.AdminService;
import com.artist.controller.ArtistController;
import com.board.domain.InquiryVO;
import com.member.controller.MemberController;
import com.member.domain.ArtistVO;
import com.member.domain.MemberVO;
import com.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private MemberService memberService;
	
	@GetMapping("main")
	public void main( HttpSession session, Integer inq_result,Model model) {
				System.out.println("admin 폼 요청 입니다!!");
				String id = (String)session.getAttribute("memId");
				MemberVO member = memberService.getMemberInfoForMypage(id);
				System.out.println("관리자 로그인 입니다"+member.getPower());
				model.addAttribute("member",member);
				model.addAttribute("inq_result",inq_result);
	}
	@GetMapping("Approval")
	public void Approval(HttpServletRequest request, Criteria cri, Model model) {
		model.addAttribute("list", adminService.getList(cri));
			
		List<ArtistVO> artist_list = adminService.getArtistInfo();
			model.addAttribute("artist_list",artist_list);
			System.out.println("아티스트 패스가 F인 아티스트 리스트 입니다"+artist_list);
	}
	@GetMapping("ready")
	public void ready(@RequestParam("prod_no") int prod_no, @ModelAttribute("cri")Criteria cri, Model model,HttpSession session) {
			model.addAttribute("product", adminService.get(prod_no));
	}
	
	//승인처리
	@PostMapping("readyPro")
	public String readyPro(ProductVO product, HttpSession session,Model model,RedirectAttributes rttr) {
		model.addAttribute("product",adminService.updatePass(product)); //업데이트 쿼리문 날려주고
		// 제품 번호가 넘어 오니까 제품 번호를 통해서 작품명이랑 작가명 가격 분할갯수
			product = adminService.bringPro(product);
				String prod_dtl_name = product.getProd_name(); // 작품명
				String prod_dtl_artist = product.getProd_artist(); //작가명
				long price = product.getProd_price(); //가격
				int pieces = product.getProd_div(); // 분할갯수
			System.out.println("product");
			int uuid_res = adminService.createUUID(prod_dtl_name,prod_dtl_artist,price,pieces); // 작품명이랑 작가명 가격 분할갯수
				rttr.addAttribute("uuid_res",uuid_res);
		return "redirect:/admin/Approval";
	}
	
	//거부처리
	@PostMapping("readyPro2")
	public String readyPro2(ProductVO product, HttpSession session, Model model) {
		int result = adminService.updateRefues(product);
		model.addAttribute("product",result);
				
		return "redirect:/admin/Approval";
	}
	//작가 심사 넘어오는곳 
	@GetMapping("artist_check")
	public void artist_check(ArtistVO artist,Model model) {
			System.out.println("아티스트 심사 페이지 요청 입니다"+artist);
		
			artist =adminService.getArtistDetail(artist);
			model.addAttribute("artist",artist);
	}
	// 작가 승인 거절 넘어오는곳
	@GetMapping("artist_result")
	public void artist_result(int result,ArtistVO artist,Model model) {
		if(result == 1) {
			System.out.println("작가 승인 신청 넘어왔습니다"+result);
			adminService.acceptArtist(artist); // D로 바꿈 
			}
			else {
					System.out.println("작가 거절 신청 넣었습니다"+result);
					adminService.declineArtist(artist); // D 로 바꿈	
				}
			model.addAttribute("result",result);
			}
	@GetMapping("Manage")
	public void manage(Model model) {
		System.out.println("manage 폼 요청");
		InquiryVO vo = new InquiryVO();
		List<InquiryVO> list = adminService.getInqList();
		model.addAttribute("list",list);
		
	}
	@GetMapping("reply")
	
	public void reply(InquiryVO vo, Model model) {
		
			vo = adminService.getInq(vo);
			
			model.addAttribute("list",vo);
		
	}
	
	@PostMapping("replyPro")
	
	public String replyPro(InquiryVO vo, RedirectAttributes redirect) {
			
			// 답변 넘어옴
			Integer inq_result = adminService.updateInq(vo);
			redirect.addAttribute("inq_result",inq_result);
		
		return "redirect:/admin/main";
		
	}
	
	
	
	@GetMapping("Ordership")
	public void Ordership() {
		
	}
	
	
	@GetMapping("Balance")
	public void Balance() {
		
	}

	}
	
	
	
	
	

