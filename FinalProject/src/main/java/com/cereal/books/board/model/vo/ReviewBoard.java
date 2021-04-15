package com.cereal.books.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewBoard {
	private int brNo; //게시판 글 번호
	
	private int userNo;//글작성자 번호
	
	private String userNname;
	
	private String brIsbn; //책 ISBN
	
	private String brPresentPic; //책 이미지 ->thumbnail할거 (아마 따로 저장 안하고 ajax로 불러올듯)
	
	private String brTitle; // 책리뷰 제목
	
	private Date brCreateDate;
	
	private Date brModifyDate;
	
	private String brBookType;
	
	private String brContent;
	
	private int brViewCount;
	
	private int brLike;
	
	private String status;
	
	private float brRating;

}
