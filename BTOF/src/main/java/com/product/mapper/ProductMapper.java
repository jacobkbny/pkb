package com.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.member.domain.ArtistVO;
import com.product.domain.Criteria;
import com.product.domain.PayInfoVO;
import com.product.domain.ProductDtlVO;
import com.product.domain.ProductVO;
import com.product.domain.SellStatusVO;

public interface ProductMapper {
	
	// 글 하나 가져오기 
	//public ProductDtlVO readDtl(int prod_dtl_no);
	public ProductVO read(int prod_no);
	
	// 페이징처리해서 전체 글 가져오기 
	public List<ProductVO> getListWithPaging(Criteria cri); 
	
	//카테고리에 따라 글 가져오기
	public List<ProductVO> getListWithCate(Criteria cri);
	
	// 전체 글의 개수 가져오기 
	public int getTotalCount(Criteria cri);
	
	// 글 전체 가져오기 
	public List<ProductVO> getList(); 
	
	// 판매 처리
	public int sellProd(List<ProductVO> prod_no);
	
	// 아티스트 작품 가져오기
	public List<ProductVO> getListWithArtist(Criteria cri);
	
	// 오너가져오기
	public String getOwner(int prod_no);
	
	//로그인한 아이디로 닉네임 가져오기
	public String getIdUser(String id);
	
	public List<ProductVO> getListWithOwn(Criteria cri);

	public List<SellStatusVO> getSellList(SellStatusVO vo);

	public SellStatusVO getBidPrice(SellStatusVO vo);

	public SellStatusVO getProd_dtl(SellStatusVO vo);
	
	public String getUserPower(String id);


	public int addArtist(ArtistVO artist);
	
	public int getBalance(SellStatusVO vo);

	public int changeBid( SellStatusVO vo);

	public int deduct(@Param("leftover")int leftover,@Param("id") String id);

	public int changeOwner(SellStatusVO vo);

	public String findSeller(int buyer_tel);

	public int updateOwner(PayInfoVO info);

	public int insHistory(PayInfoVO info);

	public List<String> getOwners(ProductVO product);

	public ProductVO getProd_info(@Param("prod_name") String prod_name,@Param("prod_artist") String prod_artist);
	
	
}
