package com.member.service;

import java.util.List;

import com.member.domain.ArtistVO;
import com.member.domain.EnrollProductVO;
import com.member.domain.MemberVO;
import com.member.domain.PrefVO;
import com.product.domain.ProductVO;
import com.product.domain.SellStatusVO;

public interface MemberService {

	public int addMember(MemberVO member);


	public String checkOwner(int prod_num);

	public int checkAccount(String Owner, String ac_num);

	public int checkPw(String pwch);

	public int insPref(PrefVO pref);

	//public int createUUID(String prod_name, String artist, int price, int pieces);
	
	public String getUserPower(String id);

	public int addArtist(ArtistVO artist);
	
	public int getBalance(String id);


	public String getNick(String id);


	public int insArtist(ArtistVO vo);


	public String getArtist(String id);


	public int insProd(EnrollProductVO enroll);


	public List<SellStatusVO> getOwnPro(String id);


	public int getProd_no(String prod_name, String artist);


	public int checkArtnick(String nickVal);
	




}
