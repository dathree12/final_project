package com.cereal.books.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Exp {
	
	/* 구매 정보 가져오니까 필요없을듯? */
//	private String expOriginImage;
//	private String expModifyImage;
//	private int expPrice;

	private int expNo; // PK
	
	private int userNo;
	
	private String userName;

	private String expTitle;
	
	private int expViewCount;
	
	private String expContent;
	
	private Date expRegDate;
	
	private String expStatus;
	
	private int bcNo; // FK
	
//	private int bfNo; // FK
}
