package com.ex.springboot.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface Reply_DAO {
	/***** 댓글 조회 *****/
	public List<Reply_DTO> selectReplyList(long idx);
	
	/***** 댓글 작성 *****/
	public int writeReply(Reply_DTO reply_dto);

	/***** 댓글 수정 *****/
	public int updateReply(Reply_DTO reply_dto);

	/***** 댓글 삭제 *****/
	public int deleteReply(Reply_DTO reply_dto);
	
}
