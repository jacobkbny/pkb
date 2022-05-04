package com.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.domain.InquiryVO;
import com.board.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
		@Autowired
	private	BoardMapper boardMapper;

		@Override
		public int addInq(InquiryVO vo) {
			int result = boardMapper.addInq(vo);
			return result;
		}

	

}
