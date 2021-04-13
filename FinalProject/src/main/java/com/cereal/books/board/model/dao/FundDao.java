package com.cereal.books.board.model.dao;

import java.util.List;

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

}
