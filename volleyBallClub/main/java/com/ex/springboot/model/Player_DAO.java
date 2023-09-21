package com.ex.springboot.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface Player_DAO {
//	index
	public List<Player_DTO> playerList1(); // 리스트를 보기 위한 select 메소드
	public List<Player_DTO> playerList2();
	public List<Player_DTO> playerList3();
	public List<Player_DTO> playerList4();
}
