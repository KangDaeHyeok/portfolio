package com.ex.springboot.model;

import lombok.Data;

@Data
public class Member_DTO {
	private String id;
	private String name;
	private String email;
	private String phone;
	private String zip_code;
	private String address;
	private String detailed_address;
	private String password;
}
