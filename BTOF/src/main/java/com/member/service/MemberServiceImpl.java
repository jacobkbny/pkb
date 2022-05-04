package com.member.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.member.domain.ArtistVO;
import com.member.domain.EnrollProductVO;
import com.member.domain.MemberVO;
import com.member.domain.PrefVO;
import com.member.mapper.MemberMapper;
import com.product.domain.ProductVO;
import com.product.domain.SellStatusVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired MemberMapper memberMapper;
	
	@Override
	public int addMember(MemberVO member) {
		int result = memberMapper.addMember(member);
		return result;
	}

	@Override
	public String checkOwner(int prod_num) {
		String Owner = memberMapper.checkOwner(prod_num);
		return Owner;
	}

	@Override
	public int checkAccount(String Owner, String ac_num) {
		System.out.println("serviceImpl 입니다");
		System.out.println("acOwenr :"+Owner);
		System.out.println("ac_num :"+ac_num);
		int result = memberMapper.checkAccount(Owner,ac_num);
		return result;
	}

	@Override
	public int checkPw(String pwch) {
		int result = memberMapper.checkPw(pwch);
		return result;
	}

	@Override
	public int insPref(PrefVO pref) {
		if(pref.getAchi()==null) {
			pref.setAchi("F");
		}else {
			pref.setAchi("T");
		}
		if(pref.getAnimal()==null) {
			pref.setAnimal("F");
		}else {
			pref.setAnimal("T");
		}
		if(pref.getArt()==null) {
			pref.setArt("F");
		}else {
			pref.setArt("T");
		}
		if(pref.getAchi()==null) {
			pref.setBallet("F");
		}else {
			pref.setBallet("T");
		}
		if(pref.getCraft()==null) {
			pref.setCraft("F");
		}else {
			pref.setCraft("T");
		}
		if(pref.getFashion()==null) {
			pref.setFashion("F");
		}else {
			pref.setFashion("T");
		}
		if(pref.getGame()==null) {
			pref.setGame("F");
		}else {
			pref.setGame("T");
		}
		if(pref.getMusic()==null) {
			pref.setMusic("F");
		}else {
			pref.setMusic("T");
		}
		if(pref.getNature()==null) {
			pref.setNature("F");
		}else {
			pref.setNature("T");
		}
		if(pref.getPhoto()==null) {
			pref.setPhoto("F");
		}else {
			pref.setPhoto("T");
		}
		if(pref.getReli()==null) {
			pref.setReli("F");
		}else {
			pref.setReli("T");
		}
		if(pref.getScience()==null) {
			pref.setScience("F");
		}else {
			pref.setScience("T");
		}
		if(pref.getSports()==null) {
			pref.setSports("F");
		}else {
			pref.setSports("T");
		}
		if(pref.getTrip()==null) {
			pref.setTrip("F");
		}else {
			pref.setTrip("T");
		}
		if(pref.getVideo()==null) {
			pref.setVideo("F");
		}else {
			pref.setVideo("T");
		}
		if(pref.getVr()==null) {
			pref.setVr("F");
		}else {
			pref.setVr("T");
		}
		
			System.out.println(pref);
		int result = memberMapper.InsPref(pref);
		return result;
	
	}

	@Override
	public int addArtist(ArtistVO artist) {
		int resultArtist = memberMapper.addArtist(artist);
		return resultArtist;
	}
	@Override
	public int getBalance(String id) {
		int balance = memberMapper.getBalance(id);
	return balance;
	}

	@Override
	public String getUserPower(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getNick(String id) {
		String nick = memberMapper.getNick(id);
		
		return nick;
	}

	@Override
	public int insArtist(ArtistVO vo) {
		int result =memberMapper.insArtist(vo);	
		return result;
	}

	@Override
	public String getArtist(String id) {
		
		String artist =memberMapper.getArtist(id);
		return artist;
	}

	@Override
	public int insProd(EnrollProductVO enroll) {
		int result =memberMapper.insProd(enroll);
		return result;
	}

	@Override
	public List<SellStatusVO> getOwnPro(String id) {
		List<SellStatusVO> list = memberMapper.getOwnPro(id);
		return list;
	}

	@Override
	public int getProd_no(String prod_name, String artist) {
		int prod_no = memberMapper.getProd_no(prod_name,artist);
		return prod_no;
	}

	@Override
	public int checkArtnick(String nickVal) {
		
		int result = memberMapper.getArtnick(nickVal);
		return result;
	}

}
	
	


