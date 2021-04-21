package com.cereal.books.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Exp {
	
	private int expNo; // PK
	
	private int userNo;
	
	private String userName;
	
	private String expOriginImage;
	
	private String expModifyImage;

	private String expTitle;
	
	private int expViewCount;
	
	private String expContent;
	
	private Date expRegDate;
	
	private String expStatus;
	
//	private int bcNo; // FK
//	private int bfNo; // FK
}
