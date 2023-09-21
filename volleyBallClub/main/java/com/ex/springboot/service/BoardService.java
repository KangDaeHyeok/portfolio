package com.ex.springboot.service;




import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ex.springboot.model.Board_DAO;
import com.ex.springboot.model.Board_DTO;

@Service
public class BoardService {
	@Autowired
	private Board_DAO board_dao;

	
	
	/***** 게시물 수정*****/
	public int updateBoard(Board_DTO board_dto) {
		if(board_dto.getNotice() == null) board_dto.setNotice("0");
		
		int result = board_dao.updateBoard(board_dto);
		
		return result;
	}
	
	
	/***** 게시글 삭제 *****/
	public int deleteBoard(Board_DTO board_dto) {
	    return board_dao.deleteBoard(board_dto);
	}
	
	
	/***** 조회수 *****/
	public int countBoard(Board_DTO board_dto) {
		
	    return board_dao.countBoard(board_dto);
	}
	
	
	/***** 게시물 상세보기 *****/
	public Board_DTO selectContent(Board_DTO board_dto) {
		// 조회수
		countBoard(board_dto);
		
	    return board_dao.selectContent(board_dto);
	}
	
	
	/***** 게시글 작성 *****/
	public int insertBoard(Board_DTO board_dto) {
		if(board_dto.getNotice() == null) board_dto.setNotice("0");
		
		int result = board_dao.insertBoard(board_dto);
		
		return result;
	}
	

}
