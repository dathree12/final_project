package com.cereal.books.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
	
	private int comNo;
	
	private String comWriter;
	
	private String comContent; 
	
	private String comCreateDate;
	
	private String comEditDate;
	
	private String comStatus;
	
	private int qaNo;
	
	private int proposeNo;
	
	private int brNo;
	
	private int bfNo;

}