package com.board.mapper;

import com.board.domain.InquiryVO;
import com.member.domain.MemberVO;

public interface BoardMapper {

	int addInq(InquiryVO vo);

	MemberVO getUserInfo(String id);


}
