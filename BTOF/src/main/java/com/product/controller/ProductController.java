package com.product.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.product.domain.Criteria;
import com.product.domain.PageDTO;
import com.product.domain.PayInfoVO;
import com.product.domain.ProductVO;
import com.product.domain.SellStatusVO;
import com.product.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/product/*")
@Log4j
public class ProductController {
	
	
	@Autowired
	private ProductService productService;
	// 메인페이지
	@GetMapping("sell_list")
	//@PreAuthorize("isAuthenticated()") //로그인한사람만접근가능
	public void sellList(HttpServletRequest request, Criteria cri, Model model,String artist_pass) {
		model.addAttribute("list", productService.getList(cri));
		int total = productService.getTotal(cri); 
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("artist_pass",artist_pass);
		//model.addAttribute("cate", request.getParameter("prod_tag"));
		
		
		
		
	}
	
		// 상품 상세 페이지 prod_no와 아티스트와 작품명이 넘어옴
	@GetMapping("sell")
	public void sell(ProductVO product, @ModelAttribute("cri")Criteria cri, Model model,HttpSession session) {
			String id = (String) session.getAttribute("memId");
					int prod_no = product.getProd_no();
					ProductVO product2 = new ProductVO(); // 상품 번호 주고 가져온 새로운 정보들을 여기에 담기	
					product2 = productService.get(prod_no); // 여기에 상품 모든 정보가 들어있음
			List<String> owners = productService.getOwners(product); // 넘어온 작가와 작품명을 주고 모든 소유자들을 뽑기
			System.out.println("작품의 소유자들 입니다"+ owners);
				int result = -1;
				if(owners.contains(id)) {
						result = 1; // 작가와 작품명으 주고 소유주들을 들고와서 list에 담고 그 안에 이사람이 있는지 확인 
				}else {
					result = 0;
				}
				model.addAttribute("ownResult",result);
				model.addAttribute("product",product2);
//			String idUser = productService.getIdUser(id);
				
//			System.out.println(idUser+"    "+owner);
			
			
			
			
//		model.addAttribute("ownResult", result);
		//int prod_dtl_no=prod_no;
		model.addAttribute("product", productService.get(product.getProd_no()));
		
		//model.addAttribute("product_dtl", productService.getDtl(prod_dtl_no));
	}
//	@PostMapping("sell")
//	public String sell(@RequestParam("prod_no") List<ProductVO> prod_no, RedirectAttributes rttr) {
//		if(productService.sellProd(prod_no)) {
//			
//		}
//		
//		return "redirect:/product/sell_list";
//	}
	
	@GetMapping("sell_listCate")
	public void sellListCate(@RequestParam("prod_tag") String prod_tag, Criteria cri, Model model) {
		model.addAttribute("cate", productService.getCate(cri));
	}
	
	@GetMapping("artistProd")
	public void artistProdList(@RequestParam("prod_artist") String prod_artist, Criteria cri, Model model) {
		model.addAttribute("artistProdList", productService.getArtistProdList(cri));
		
	}
	
	@GetMapping("buy")
	public String buy(SellStatusVO vo,Model model) {
			// select count(prod_dtl_sales='T') from test_dtl2; 
			System.out.println("prod_name:"+vo.getProd_name());
				model.addAttribute("prod_name",vo.getProd_name());
			System.out.println("prod_artist:"+vo.getProd_artist());
				model.addAttribute("prod_artist",vo.getProd_artist());
			System.out.println("prod_div:"+vo.getProd_div());
				model.addAttribute("prod_div",vo.getProd_div());
							// 필요한거 작가명, 작품명 r
					String artist = vo.getProd_artist();
					String prod_name = vo.getProd_name();
						vo.setProd_dtl_name(prod_name);
						vo.setProd_dtl_artist(artist);
						//prod_name , prod_artist 
				List<SellStatusVO> list = productService.getSellList(vo);
					System.out.println("list 입니다.------------"+list);
					System.out.println("list ------"+list);
					//시리얼넘버 , 가격 , 판매자 
					model.addAttribute("list",list);
					return "/product/buy";
			
	}
	@GetMapping("Bidbuy")
	public void Bidbuy(SellStatusVO vo,Model model) {
		// 상품 디테일 테이블에서 상품 고유 번호 줄테니 , 가격 , 시리얼 넘버 입찰인건 이미 앞에서 걸러줌
			System.out.println("Bidbuy 폼 요청");
			System.out.println("쿼리문 사용전에 vo--------"+vo);
			//select * from test_dtl2 where prod_dtl_no=43
			vo = productService.getBidPrice(vo); //현재 최고 입찰가 가져오기 
			System.out.println("쿼리문 사용후에 vo -------"+vo);
			Date d = Date.valueOf("2022-04-27");
			vo.setProd_dtl_endday(d);
			model.addAttribute("list",vo);
	}
	@PostMapping("BidbuyPro")
	public String BidbuyPro(SellStatusVO vo,HttpSession session,Model model) {
		System.out.println("BidbuyPro입니다"+vo.getProd_dtl_bid_price());
		System.out.println("BidbuyPro입니다"+vo.getProd_dtl_artist());
		System.out.println("BidbuyPro입니다"+vo.getProd_dtl_name());
		System.out.println("BidbuyPro입니다"+vo.getProd_dtl_no());
			String id = (String)session.getAttribute("memId");
				vo.setId(id);
				System.out.println("id입니다---------"+id);
					int result =-1;
				int balance = productService.getBalance(vo); // 잔액 가져오는 쿼리문
				int price = vo.getProd_dtl_bid_price();
					if(price>balance) { // 입찰 희망 가격이 현재 잔액보다 높다면 
							System.out.println("입찰 희망 가격보다 잔액이 작아서 입찰 실패");
						result=0;
					}
					else if (balance>price) { //잔액이 입찰 희망 가격보다 높다면
							System.out.println("잔액이 입찰 희망가보다 높아서 정상적으로 입찰 처리");
					 result = productService.changeBid(vo);
					}
					System.out.println("입찰하는 쿼리문 실행후--------"+result);
				model.addAttribute("result",result);
			// update 쿼리문 날리기
			// update test_dtl2 set prod_dtl_bid_price = #{prod_Dtl_bid_price}, prod_dtl_owner=id where prod_dtl_artist = #{prod_dtl_artist} and prod_dtl_name=#{prod_dtl_name}
		return "/product/BidbuyPro";
	}
	//  상품 고유 넘버만 넘어옴
	@GetMapping("Fixbuy")
	public String FIxbuy(SellStatusVO vo,Model model,HttpSession session) {
		// 상품 디테일 테이블에서 r넘버 줄테니 , 가격 , 시리얼 넘버 지정가인건 이미 앞에서 걸러줌
		String id = (String)session.getAttribute("memId");
					// 상품고유넘버 줄테니 성품 정보 다 가져오기 
			System.out.println("id 입니다~--------"+id);
			vo = productService.getProd_dtl(vo); //  
				vo.setId(id);
				System.out.println(vo);
				System.out.println("쿼리문 사용후 vo 입니다~"+vo);
			model.addAttribute("list",vo);
		return "/product/Fixbuy";
	}
	@PostMapping(value="insertPayInfo", consumes = "application/json",
			produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> insertPayInfo(@RequestBody PayInfoVO info ){
		System.out.println("infoPay 입니다~-------"+info);
			String seller = productService.findSeller(info.getBuyer_tel());// 상품 고유 번호 줄테니 현재 소유자 가져와 
				info.setSeller(seller);	 //명의 이전 하기 전에 소유자 먼저 가져와서 판매자로 변수에 담아주기
		//name  = 작품명 , buyer_name = id 추후에 소유자로 바꿔줌 , buyer_tel = 상품 고유 번호 , paid_amount = 상품 가격
				int result = productService.updateOwner(info); //명의 의전
				System.out.println("명의 의전 하는 쿼리문 실행후 입니다.");
				int result2	=productService.InsHistory(info);
				System.out.println("거래내역 저장하는 쿼리문 실행 후 result 입니다"+result2);
			// int result = update test_dtl2 set pord_dtl_owner=#{buyer_name},prod_dtl_price=#{paid_amount} from testl_dtl2 where prod_dtl_no=#{buyer_tel} 소유자 업데이트 해주고
			// history 	insert 
						//insert into history(prod_name,seller,buyer,price)values(#{name},#{seller},#{buyer_name},#{paid_amount})
		//int result = 1;
		return result == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); 
		
	}
	@GetMapping("purchase")
		//고유 번호 를 보내줌 (몇번째 상품인지 알려주기 위해서 )
	public void purchase(SellStatusVO vo,Model model,HttpSession session) {
			String id = (String)session.getAttribute("memId");
			vo.setId(id);
				int balance = productService.getBalance(vo);
			model.addAttribute("balance",balance);
			model.addAttribute("list",vo);
			//밸런스 가져오는 쿼리문 작성해서 모델에 보내주기 
	}
	
	@GetMapping("balancePay")
	public void balancePay( SellStatusVO vo,HttpSession session,Model model) {
			String id = (String)session.getAttribute("memId");
			vo.setId(id); // 아이디 설정 owner update를 위해서  위해서
			int balance = productService.getBalance(vo); // id 줄게 밸런스 가져와
			int price=vo.getProd_dtl_price(); // 가격은 jsp에서 보내줬음
				int leftover = balance-price;
					model.addAttribute("leftover",leftover);
				int result = productService.deduct(leftover,id); //구매한거만큼 금액 차감 
						productService.changeOwner(vo);
					model.addAttribute("result",result);
			System.out.println("id는 ----------------"+id);
			System.out.println("vo는 -----------" +vo);
				
	}
	
}
