package com.cereal.books.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int userNo;
	
	private String userId;
	
	private String userPwd;
	
	private String userRole;
	
	private String userNname;
	
	private String userName;
	
	private String userPhone;
	
	private String userEmail;
	
	private String userAddress;
	
	private String userGenre;
	
	private String userAgreement;
	
	private Date userEnrollDate;
	
	private Date userModifyDate;
	
	private String status;
	
}
