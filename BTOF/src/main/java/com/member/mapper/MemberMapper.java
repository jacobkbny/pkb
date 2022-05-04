package com.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.member.domain.ArtistVO;
import com.member.domain.EnrollProductVO;
import com.member.domain.MemberVO;
import com.member.domain.PrefVO;
import com.product.domain.ProductVO;
import com.product.domain.SellStatusVO;

public interface MemberMapper {

	public int addMember(MemberVO member);
	
	public MemberVO getMember(String id);

	public void enrollProduct(@Param("id") String id,@Param("prod_name") String prod_name, @Param("price") int pieces,@Param("price") int price, @Param("content") String content,
			@Param("serial_num") List<String> serial_num, @Param("uuid_val") List<String> uuid_val);

	public String checkOwner(int prod_num);

	public int checkAccount(@Param("Owner") String Owner, @Param("ac_num")String ac_num);

	public int checkPw(String pwch);

	public int InsPref(PrefVO pref);

	public int insProduct(@Param("id") String id,@Param("prod_name") String prod_name,@Param("pieces") int pieces,@Param("content") String content, @Param("cate") String cate, @Param("file") String fileName);

	public int insProd_dtl(@Param("id") String id,@Param("price") int price, @Param("uuid") String string);

	public int insUUID(@Param("prod_name") String prod_name, @Param("artist") String artist, @Param("price") long price, @Param("uuid") String string);

	public int addArtist(ArtistVO artist);

	public int getBalance(String id);

	public String getNick(String id);

	public int insArtist(ArtistVO vo);

	public String getArtist(String id);

	public int insProd(EnrollProductVO enroll);

	public List<SellStatusVO> getOwnPro(String id);

	public int getProd_no(@Param("prod_name") String prod_name, @Param("artist")String artist);

	public int getArtnick(String nickVal);
	
}
