package com.cereal.books.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewBoard {
	private int brNo;
	
	private int userNo;
	
	private String userNname;	
	
	private int brIsbn;
	
	private String brPresentPic;
	
	private String brTitle;
	
	private Date brCreateDate;
	
	private Date brModifyDate;
	
	private String brBookType;
	
	private String brContent;
	
	private int brViewCount;
	
	private int brLike;
	
	private String status;
	
	private float brRating;

}
