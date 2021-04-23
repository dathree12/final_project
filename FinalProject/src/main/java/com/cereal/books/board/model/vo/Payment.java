package com.cereal.books.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Payment {
	private int payNo;
	
	private int userNo;
	
	private Date payEnrollDate;
	
	private String payProgress;
	
	private int payPrice;
	
	private String payStatus;
	
	private String payItem;
	
	private int bcNo;
	
	private int bfNo;
	
	private String payTitle;
	
}
