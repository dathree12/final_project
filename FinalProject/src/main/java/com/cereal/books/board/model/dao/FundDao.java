package com.cereal.books.board.model.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
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
	List<FundBoard> adminFundList(@Param("rowBounds") RowBounds rowBounds, @Param("status") String status);

	int selectFundStatusCount(String status);
	
	int adminUpdateFundStatus(@Param("status") String status, @Param("bfNo") int bfNo);
	
	// 마이페이지 (참여 / 제안)
	List<FundBoard> myFundList(@Param("rowBounds") RowBounds rowBounds, @Param("userNo") int userNo);
	
	int selectMyFundCount(int userNo);

	List<FundBoard> myAplctFundList(@Param("rowBounds") RowBounds rowBounds, @Param("userNo") int userNo);
	
	int selectMyAplcFundCount(int userNo);
	
	// viewDetail 해당 번호 찾는 메소드
	FundBoard selectBoardDetail(int bfNo);
	
	// 조회수, 일정시간 이후 조회수 +1 구현해야
	int increateViewcnt(int bfNo);

}
