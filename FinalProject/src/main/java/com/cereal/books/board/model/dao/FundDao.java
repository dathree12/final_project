package com.cereal.books.board.model.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.cereal.books.board.model.vo.FundBoard;

@Mapper
public interface FundDao {

	int selectCount();

	List<FundBoard> selectBoardList(RowBounds rowBounds);

	int saveRemainDate();

	int changeStatus();

	int insertBoard(FundBoard fundboard);

	// 관리자
	List<FundBoard> adminFundList(RowBounds rowBounds, String status);

	int selectFundStatusCount(String status);
	
	// 마이페이지 (참여 / 제안)
	List<FundBoard> myFundList(RowBounds rowBounds, int userNo);
	
	int selectMyFundCount(int userNo);

	List<FundBoard> myAplctFundList(RowBounds rowBounds, int userNo);
	
	int selectMyAplcFundCount(int userNo);
	
	// viewDetail 해당 번호 찾는 메소드
	FundBoard selectBoardDetail(int bfNo);
	
	// 조회수, 일정시간 이후 조회수 +1 구현해야
	int increateViewcnt(int bfNo);

}
