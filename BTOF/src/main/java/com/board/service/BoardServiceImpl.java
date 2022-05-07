package com.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.domain.InquiryVO;
import com.board.mapper.BoardMapper;
import com.member.domain.MemberVO;

@Service
public class BoardServiceImpl implements BoardService {
	
		@Autowired
	private	BoardMapper boardMapper;

		@Override
		public int addInq(InquiryVO vo) {
			int result = boardMapper.addInq(vo);
			return result;
		}

		@Override
		public MemberVO getUserInfo(String id) {
			MemberVO member = boardMapper.getUserInfo(id);
			return member;
		}

	

}
