package com.ex.springboot.model;

import lombok.Data;

@Data
public class Board_DTO {
	private long idx;
	private String title;
	private String content;
	private String id;
	private String writer;
	private int count;
	private String notice;
	private String secret;
	private String secret_num;
	private String insert_time;
}
