package com.cereal.books.board.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.cereal.books.board.model.vo.ClubBoard;
import com.cereal.books.board.model.vo.Exp;
import com.cereal.books.board.model.vo.Payment;

/*
 * 작성 순서
 * 1. Mybatis Mapper 설정
 * 2. DB Schema(Table 등) 작성
 * 3. Mapper.xml 작성
 * 4. VO 객체 생성
 * 5. DAO interface 작성
 * 6. DAO 구현 class 작성
 */

/*
 * Mapper 인터페이스란?
 *  : Mybatis mapper.xml에 기재된 SQL을 호출하기 위한 인터페이스
 * 
 * Mapper 인터페이스를 사용하지 않을 경우
 *  : session.selectOne( ... ) 등 메소드 사용해야한다.
 *  : DAO 클래스 작성
 *  : SqllSession 등록 등..
 */

@Mapper
public interface ClubDao {

	int selectCount();

	int saveRemainDate();

	int noneRemainDate();

	int insertClub(ClubBoard clubBoard);

	int selectExpCount(int bcNo);

	int adminClubStatusCount(String status);

	int selectMyClubCount(int userNo);

	int insertExp(Exp exp);

	int increaseViewcnt(int bcNo);

	int insertPayment(Payment payment);

	int plusReachPrice(ClubBoard clubBoard);

//	int updateClub(ClubBoard clubBoard);

	ClubBoard selectClubDetail(int bcNo);

	ClubBoard findClubByNo(int bcNo);

	ClubBoard findBoardByNo(int bcNo);

	List<ClubBoard> selectClubList(RowBounds rowBounds);

	List<ClubBoard> selectDlClubList();

	// 관리자 페이지
	List<ClubBoard> adminClubList(@Param("rowBounds") RowBounds rowBounds, @Param("status") String status);

	// 마이페이지 (참여, 신청)
	List<ClubBoard> myClubList(@Param("rowBounds") RowBounds rowBounds, @Param("userNo") int userNo);

}
