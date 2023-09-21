package com.ex.springboot.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface Board_DAO{
	/***** 게시글 조회수 *****/
	public int countBoard(Board_DTO board_dto);
	
	
	/***** 게시글 수정 *****/
	public int updateBoard(Board_DTO board_dto);
	
	
	/***** 게시글 삭제 *****/
	public int deleteBoard(Board_DTO board_dto);	
	
	
	/***** 게시글 등록 *****/
	public int insertBoard(Board_DTO board_dto);
	
	
	/***** 게시글 리스트 + 검색 *****/
	public List<Board_DTO> searchBoardList(Map<String, Object> map);
	
	
	/***** 게시글 갯수 *****/
	public int selectBoardCount(Map<String, Object> map);
	
	
	/***** 공지 게시글 *****/
	public List<Board_DTO> selectBoardNotice();
	
	
	/***** 게시글 상세보기 *****/
	public Board_DTO selectContent(Board_DTO board_dto);
}
