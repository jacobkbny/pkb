package com.product.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.common.service.CommonService;
import com.member.service.MemberService;
import com.product.service.ProductService;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@RequestMapping(value = "/buyAuction", method = RequestMethod.GET)
	public String login() {
		return "/product/buyAuction";					
	}
	@Autowired
	ProductService productService;
	@Autowired
	CommonService commonService;
	@Autowired
	MemberService memberService;
	
	
	@RequestMapping(value = "/buyBid")
	public String loginProcess(HttpSession session, HttpServletRequest request, Model model) {
		String start = "2022-04-23 18:22:00";
		String endT = "2022-04-26 18:54:30";
		String open = "2022-04-26 18:30:00";
		String result = "";
		
		Date now = new Date();
		int price = 10000; // 시작가 - 현재는 임의값, db에서 불러오게 연결
		String id = (String)session.getAttribute("memId");
		model.addAttribute("id", id);
		if(id==null) {
			return "redirect:../common/login";
		}
		int balance = memberService.getBalance(id);
		System.out.println(balance);

	
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		try {
			Date start_time = dateFormat.parse(start);
			Date end_time = dateFormat.parse(endT);
		//	Date open_time = dateFormat.parse(open);
			
			if( now.getTime() < end_time.getTime()) {
				logger.info("Welcome "+id);
				
				// HttpSession session = request.getSession();
				session.setAttribute("id", id);
				model.addAttribute("end", endT);
				model.addAttribute("now", now);
				model.addAttribute("open", open);
				model.addAttribute("price", price);
				model.addAttribute("balance", balance);
				
				result = "product/buyBid";
			}else if(now.getTime() < start_time.getTime()){
				result = "product/yet";
			}else {
				result = "product/end";
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}
		@RequestMapping(value = "/waitingRoom")
		public String goWaiting(HttpSession session, HttpServletRequest request, Model model) {
			String start = "2022-04-23 18:22:00";
			String endT = "2022-04-26 18:54:30";
			String open = "2022-04-26 18:30:00";
			String result = "";
			Date now = new Date();
			String id = (String)session.getAttribute("memId");
			int price = 10000; // 시작가 - 현재는 임의값, db에서 불러오게 연결
			int balance = memberService.getBalance(id);
			System.out.println(balance);

		
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			try {
				Date start_time = dateFormat.parse(start);
				Date end_time = dateFormat.parse(endT);
				Date open_time = dateFormat.parse(open);
				
				if( now.getTime() < open_time.getTime()) {
					logger.info("Welcome "+id);
					
					// HttpSession session = request.getSession();
					session.setAttribute("id", id);
					model.addAttribute("end", endT);
					model.addAttribute("now", now);
					model.addAttribute("open", open);
					model.addAttribute("price", price);
					model.addAttribute("balance", balance);
					
					result = "product/waitingRoom";
				}else if(now.getTime() < start_time.getTime()){
					result = "product/yet";
				}else if(now.getTime() >= open_time.getTime() && now.getTime() < end_time.getTime()){
					result = "product/openEnd";
				}else {
					result = "product/end";
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return result;
	}	
	
}