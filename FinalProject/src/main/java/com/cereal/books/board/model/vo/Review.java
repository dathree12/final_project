package com.cereal.books.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {

	private int rvNo; // PK
	
	private int userNo;
	
	private String rvOriginImage; // 상품 이미지
	
	private String rvModifyImage;
	
	private String boardOriginTitle; // 구매 상품 제목 
	
	private int boardPrice; // 구매 상품 가격
	
	private String rvTitle;
	
	private String rvContent;
	
	private Date rvRegDate;
	
	private int bcNo; // FK
	
	private int bfNo; // FK
}
