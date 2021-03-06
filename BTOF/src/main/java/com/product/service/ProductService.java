package com.product.service;

import java.util.List;

import com.product.domain.Criteria;
import com.product.domain.PayInfoVO;
import com.product.domain.ProductDtlVO;
import com.product.domain.ProductVO;
import com.product.domain.SellStatusVO;

public interface ProductService {
		
		// 글 하나 가져오기 
		public ProductVO get(int prod_no);
		
		// 전체글 페이징처리해서 가져오기
		public List<ProductVO> getList(Criteria cri);
		
		//카테고리
		public List<ProductVO> getCate(Criteria cri);
		
		// 전체 글의 개수 가져오기
		public int getTotal(Criteria cri);
		
		//판매기능
		public boolean sellProd(List<ProductVO> prod_no);

		//아티스트작품보기
		public List<ProductVO> getArtistProdList(Criteria cri);

		//오너일때 판매 아닐때 구매
		public String getOwner(int prod_no);
		
		//로그인한 아이디로 닉네임가져오기
		public String getIdUser(String id);

		public List<ProductVO> getOwnList(Criteria cri);

		public List<SellStatusVO> getSellList(SellStatusVO vo);

		public SellStatusVO getBidPrice(SellStatusVO vo);

		public SellStatusVO getProd_dtl(SellStatusVO vo);

		public int changeBid(SellStatusVO vo);

		public int getBalance(SellStatusVO vo);

		public int deduct(int leftover,String id);

		public void changeOwner(SellStatusVO vo);

		public String findSeller(int buyer_tel);

		public int updateOwner(PayInfoVO info);

		public int InsHistory(PayInfoVO info);

		public List<String> getOwners(ProductVO product);

		public ProductVO getProd_info(String prod_name, String prod_artist);

		
		
	
}
