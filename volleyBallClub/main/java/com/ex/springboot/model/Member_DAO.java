package com.ex.springboot.model;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface Member_DAO {
	/***** 회원가입 *****/
	public int insertMember(Member_DTO member_dto);
	
	
	/***** 마이페이지 *****/
	public Member_DTO selectMember(String id);
	
	
	/***** 내 정보 수정 *****/
	public int updateMember(Member_DTO member_dto);
	
	
	/***** 회원탈퇴 *****/
	public int deleteMember(Member_DTO member_dto);
	
	
	/***** 아이디 중복 확인 *****/
	public int idCheck(Member_DTO member_dto);
	
	
	/***** 로그인 *****/
	public Member_DTO getMember(Member_DTO member_dto);
}


