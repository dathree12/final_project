package com.cereal.books.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClubBoard {

	private int bcNo; // 북클럽 번호
	
//	private int bcWriterNo; // 북클럽 작성자
	
	private String userId;
	
	private String bcOriginTitle; // 북클럽 제목
	
	private String bcSubTitle; // 북클럽 소제목
	
	private int bcPrice; // 북클럽 가격
	
	private Date bcRegDate; // 북클럽 등록일정, 메인페이지에 추가 될
	
	private Date bcStartDate; // 북클럽 등록일정, 클럽 시작일정
	
	private Date bcDeadLineDate; // 북클럽 마감일정, 클럽 마감일정
	
	private int bcRemainDate;
	
	private int bcViewCount; // 북클럽 조회수
	
	private String bcContent; // 북클럽 상세내용
	
	private int bcCommentCount; // 북클럽 댓글수
	
	private String bcOriginImage; // 북클럽 대표이미지
	
	private String bcModifyImage; // 북클럽 대표이미지 수정
	
	private String bcStatus; // 북클럽 상태, (Nonepass, Pass, Deque, Queue)
	
	private String bcAgreement; // 북클럽 약관
	
}
