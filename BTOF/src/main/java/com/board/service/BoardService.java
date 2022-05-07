package com.board.service;

import com.board.domain.InquiryVO;
import com.member.domain.MemberVO;

public interface BoardService {

	int addInq(InquiryVO vo);

	MemberVO getUserInfo(String id);

	
	
}
