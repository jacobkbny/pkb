package com.admin.mapper;

import java.util.List;

import com.admin.domain.Criteria;
import com.admin.domain.ProductVO;
import com.board.domain.InquiryVO;
import com.member.domain.ArtistVO;





public interface AdminMapper {
		
		// 페이징처리해서 전체 글 가져오기 
		public List<ProductVO> getListWithPaging(Criteria cri); 
		
		// 해당 작품 정보가져오기
		public ProductVO read(int prod_no);

		// 작품 승인 처리
		public int updatePass(ProductVO product);
		
		// 작품 거부 처리
		public int updateRefues(ProductVO product);
		
		// 작품 거부시 삭제처리
		public int deleteRefues(ProductVO product);

		public List<InquiryVO> getInqList();

		public InquiryVO getInq(InquiryVO vo);

		public int updateInq(InquiryVO vo);

		public ProductVO bringPro(ProductVO product);

		public List<ArtistVO> getArtistInfo();

		public ArtistVO getArtistDetail(ArtistVO artist);

		public void acceptArtist(ArtistVO artist);

		public void declineArtist(ArtistVO artist);

}
