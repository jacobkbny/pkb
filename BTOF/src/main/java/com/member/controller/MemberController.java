package com.member.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.member.domain.ArtistVO;
import com.member.domain.EnrollProductVO;
import com.member.domain.PrefVO;
import com.member.service.MemberService;
import com.product.domain.Criteria;
import com.product.domain.ProductVO;
import com.product.domain.SellStatusVO;
import com.product.service.ProductService;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/member/")
@Log4j
	

public class MemberController {
	
	@Autowired MemberService memberService;
	@Autowired ProductService productService;

	
	
	
	
	
	//css받고다시
	@GetMapping("collection")
	public void collection(HttpSession session ,Criteria cri, Model model) {
		
			String id = (String)session.getAttribute("memId");
						System.out.println("컬렉션의 id입니다------"+id);
				//id = prod_dtl_owner 랑 같은 거 가져오기
			List<SellStatusVO> list= memberService.getOwnPro(id);
									
				
		model.addAttribute("list",list);	
		
		
	}
	@GetMapping("sender")
	public String sender(SellStatusVO vo , RedirectAttributes rttr) {
				String prod_name=vo.getProd_dtl_name();
				String artist = vo.getProd_dtl_artist();
				int prod_number = memberService.getProd_no(prod_name,artist);
		
			return "redirect:/product/sell?prod_no="+prod_number;
	}
	
	
	//나중
	@GetMapping("enrollArtist")
	public void enrollArtist() {
		System.out.println("작가등록폼요청");
	}
	@PostMapping("enrollArtistPro")
	public String enrollArtistPro(ArtistVO vo, MultipartHttpServletRequest request,Model model,HttpSession session) {
			
		System.out.println("작가등록프로페이지요청");
			String id =(String) session.getAttribute("memId");
				String nick=memberService.getNick(id); // 아이디 주고 닉네임 받아오기
				vo.setArtist_nick(nick);
				int result2 = memberService.checkArtnick(vo.getArtist_name());
				if(result2 == 1) {
					model.addAttribute("result2",result2);
				}else if(result2 != 1) {	
					MultipartFile mf = request.getFile("img");
			System.out.println("작가 이름 :"+vo.getArtist_name());
			System.out.println("자기소개 :"+vo.getArtist_introd());
			System.out.println("파일 크기 : "+mf.getSize());
			System.out.println("파일 확장자 :"+mf.getName());
			System.out.println("파일 이름"+mf.getOriginalFilename());
				System.out.println("enrollArtist vo  입니다--------"+vo);
				String savePath=request.getRealPath("resources\\save");
				System.out.println("savePath :"+savePath);
				String orgName= mf.getOriginalFilename();
				UUID uuid =UUID.randomUUID();
				String newName = uuid+orgName;
				vo.setArtist_id(newName);
				String imgPath = savePath +"\\"+newName;
				File f= new File(imgPath);
				try {
				mf.transferTo(f);
				}catch(IOException e) {
					e.printStackTrace();
				}
				int result = memberService.insArtist(vo);
				System.out.println("insArtist 후 result 입니다~---"+result);
				model.addAttribute("result",result);
				}
				return "/member/enrollArtistPro";
	}
		@RequestMapping("ajaxArtistNick")
		
		public ResponseEntity<String> artistNick(String nick){
				
			int result =memberService.checkArtnick(nick);
				String res = "";
				if(result == 1) {
					res = "존재하는 활동명 입니다. 다른 활동명을 이용해주세요";
				}else {
					res ="사용 가능한 활동명 입니다.";
				}
				HttpHeaders responseHeader = new HttpHeaders();
				responseHeader.add("Content-Type","text/html;charset=utf-8");
				return new ResponseEntity<String>(res,responseHeader, HttpStatus.OK);
		}
	
	
	//나중
	@GetMapping("enrollProduct")
	public void enrollProduct() {
		System.out.println("작품 등록 페이지 요청");
		
	}
	@PostMapping("enrollProductPro")
		public String enrollProductPro(EnrollProductVO enroll,MultipartHttpServletRequest request,HttpSession session,Model model) {		
			MultipartFile mf = request.getFile("file");
				System.out.println("getname 메소드 썼을떄 출력문"+mf.getName());
				System.out.println("getOriginalName 썼을떄 출력문"+mf.getOriginalFilename());
					String fimeName=mf.getOriginalFilename();
					enroll.setProd_file(fimeName);
						
						String id = (String)session.getAttribute("memId");
					String artist = memberService.getArtist(id);
						enroll.setProd_artist(artist);
						int result = memberService.insProd(enroll);
								
			System.out.println("파일이름 :"+enroll.getProd_file());
			System.out.println("prod_name :"+enroll.getProd_name());
			System.out.println("cate:"+enroll.getProd_tag());
			System.out.println("pieces :"+enroll.getProd_div());
			System.out.println("price:"+enroll.getProd_price());
			System.out.println("작품소개 :"+enroll.getProd_descr());
						model.addAttribute("result",result);
						
				//int uuid_result =memberService.createUUID(enroll.getProd_name(),enroll.getArtist(),enroll.getPrice(),enroll.getPieces());
					//System.out.println("uuid-result ---------------:"+ uuid_result);
			// UUid는 서비스에서 만들기 
		
			//작가명, 작품명 , 분할 갯수 , 가격 
			return "/member/enrollProductPro";
	}
	
	@GetMapping("userPref")
	public void userPref() {
		System.out.println("userPref 폼 요청");
	}
	@PostMapping("userPref")
	public String userPrefPro(PrefVO pref, RedirectAttributes redirect,HttpSession session) { //취향선택후 로그인페이지로보내기
		String id = (String) session.getAttribute("memId");
			pref.setId(id);
		int result = memberService.insPref(pref);
			redirect.addAttribute("pref_result",result);
				System.out.println("result ------------"+result);
		return "redirect:../common/login";
	}
	
	//합칠준비
		//메인 페이지에서 상품 클릭 후 오는곳이니까 메인페이지에서 세션에 있는 닉네임을 여기로 보내주고 , 고유상품번호 보내줌
		//판매자가 이 페이지를 들어갔을떄는 선택 및 구매 버튼이 아니라 , 판매 취소 버튼이 보여야함
	@GetMapping("product_detail")
	public String product_detail(String nick , int prod_num,Model model) {
		System.out.println("product_detail 요청!");
		int result = -1;
	String prod_Owner = memberService.checkOwner(prod_num);
	// 세션에 있는 닉네임과 , 고유 상품 번호를 보내서 소유자를 꺼내오고 , 쿼리문을 이용해서 상품 고유번호를 주고 소유자를 꺼내오고 , 그 소유자가 닉네임이랑 일치한다면, 판매 취소 버튼이 보이도록
		if(nick.equals(prod_Owner)) {
			result = 2; // 판매 취소 버튼이 보이도록 c:if 조치
		} else {
			result = 1; // 선택 및 구매 버튼이 보이도록 c:if 조치
		}
		model.addAttribute("result",result);
		return "/member/product_detail";
	}
	@GetMapping("enroll_ba")
	public void enroll_ba() {
		System.out.println("계좌등록 폼 요청");
	}
	
	@PostMapping("enroll_baPro") 
	public String enroll_baPro(String pwch,Model model) {
		int result = memberService.checkPw(pwch);
			System.out.println("controller Result : "+result);
			model.addAttribute("result",result);
		// 쿼리문 작성 select count(*) from hbank where acOwner =#{acOwner} and ac_num=#{ac_num}
		return "/member/enroll_baPro";
	}
	@RequestMapping("ajaxBankCheck")
	public ResponseEntity<String> ajaxBankCheck(String Owner , String ac_num){
			System.out.println("acOwenr :"+Owner);
			System.out.println("ac_num :"+ac_num);
			String res = "";
			int result = memberService.checkAccount(Owner , ac_num);
			if(result == 1) {
				res = "사용가능한 계좌입니다";
			}else {
				res ="계좌 정보가 불일치 합니다. 다시 입력해주세요";
			}
		HttpHeaders responseHeader = new HttpHeaders();
		responseHeader.add("Content-Type","text/html;charset=utf-8");
		return new ResponseEntity<String>(res,responseHeader,HttpStatus.OK);
	}
}
