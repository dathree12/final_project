package com.cereal.books.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Propose {
	
	private int proposeNo;
	
	private int userNo;
	
	private String userId;
	
	private String userName;
	
	private int proposePwd;
	
	private String proposeTitle;
	
	private Date proposeRegDate;
	
	private int proposeViewCount;
	
	private String proposeContent;
	
	private String proposeStatus;
}
