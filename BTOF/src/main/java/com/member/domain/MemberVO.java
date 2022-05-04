package com.member.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String user_id; 
	private String user_pwd; 
	private String user_tell; 
	private String user_nick;
	private String user_birday;
	private String gend;
	private String rec;
	private Integer wallet; 
	private String user_inter;
	private String user_grade;
	private String user_sales;
	private String user_power; // 일반회원 "u", 작가"a", 관리자"m"
	private Timestamp updateDate; //가입일은 이 프로젝트에서는 특별히 쓸일없으니까 안만들어도되겠지
	private List<AuthVO> authList;
	
}
