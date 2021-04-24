package com.cereal.books.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QA {
	
	private int qaNo;
	
	private int userNo;
	
	private String qaWriter;
	
	private String qaItem;
	
	private String qaTitle;
	
	private String qaContent;
	
	private int qaViewCount;
	
	private Date qaEnrollDate;
	
	private Date qaModifyDate;
	
	private String qaStatus;

}
