package com.cereal.books.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookScrap {
	private String title;
	
	private String content;
	
	private String boardType;
	
	private int boardNo;
	
	private Date boardDate;
	 
	
}