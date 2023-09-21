package com.ex.springboot.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface League_DAO {
	public List<League_DTO> tableList(); // 리스트를 보기 위한 select 메소드
	
}
