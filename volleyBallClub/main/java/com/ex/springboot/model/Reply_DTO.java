package com.ex.springboot.model;

import lombok.Data;

@Data
public class Reply_DTO {
	private long idx;
	private long b_idx;
	private String id;
	private String title;
	private String content;
	private String writer;
	private String insert_time;
}
