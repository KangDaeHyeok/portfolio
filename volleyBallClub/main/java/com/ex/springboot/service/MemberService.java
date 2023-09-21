package com.ex.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ex.springboot.model.Member_DAO;
import com.ex.springboot.model.Member_DTO;

@Service
public class MemberService {
	
	@Autowired
	private Member_DAO member_dao;
	
	/***** 회원가입 *****/
	public int insertMember(Member_DTO member_dto) {
		if(member_dto.getDetailed_address() == null) member_dto.setDetailed_address("");
		
		int result = member_dao.insertMember(member_dto);
		
		return result;
	}
	
	/***** 아이디 중복확인 *****/
	public int idCheck(Member_DTO member_dto) {
		int result = member_dao.idCheck(member_dto);
		
		return result;
	}
	
	/***** 로그인 *****/
	public Member_DTO getMember(Member_DTO member_dto) {
		return member_dao.getMember(member_dto);
	}
	
	
	/***** 마이페이지 *****/
	public Member_DTO selectMember(String id) {
		return member_dao.selectMember(id);
	}
	
	
	/***** 회원탈퇴 *****/
	public int deleteMember(Member_DTO member_dto) {
		int result = member_dao.deleteMember(member_dto);
		
		return result;
	}
	
	
	/***** 회원정보수정 *****/
	public int updateMember(Member_DTO member_dto) {
		if(member_dto.getDetailed_address() == null) member_dto.setDetailed_address("");
		
		int result = member_dao.updateMember(member_dto);
		
		return result;
	}
}
