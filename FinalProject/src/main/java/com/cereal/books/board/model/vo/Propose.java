package com.cereal.books.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Propose {
	
	private int proposeNo;
	
	private int userNo;
	
	private int userName;
	
	private String userId;
	
	private String proposeTitle;
	
	private Date proposeRegDate;
	
	private int proposeViewCount;
	
	private String proposeContent;
	
	private String proposeStatus;
}
