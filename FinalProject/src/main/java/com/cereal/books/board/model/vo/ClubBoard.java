package com.cereal.books.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClubBoard {

	private int bcNo; // 북클럽 번호
	
	private int userNo; // 북클럽 작정자 번호 = writeNo
	
	private String userName; // 사용자 이름
	
	private String bcOriginTitle; // 북클럽 제목
	
	private String bcSubTitle; // 북클럽 소제목
	
	private int bcPrice; // 북클럽 가격
	
	private String bcWriter; // 북클럽 작성자
	
	private Date bcRegDate; // 북클럽 등록일정
	
	private Date bcDeadLineDate; // 북클럽 마감일정
	
	private int bcViewCount; // 북클럽 조회수
	
	private String bcContent; // 북클럽 상세내용
	
	private int bcCommentCount; // 북클럽 댓글수
	
	private String bcOriginImage; // 북클럽 대표이미지
	
	private String bcModifyImage; // 북클럽 대표이미지 수정
	
	private String bcStatus; // 북클럽 상태, (Nonepass, Pass, Deque, Queue)
	
	private String bcAgreement; // 북클럽 약관
	
}
