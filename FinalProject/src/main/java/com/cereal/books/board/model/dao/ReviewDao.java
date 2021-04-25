package com.cereal.books.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.cereal.books.board.model.vo.BookScrap;
import com.cereal.books.board.model.vo.Comment;
import com.cereal.books.board.model.vo.ReviewBoard;

@Mapper
public interface ReviewDao {

		int updateReviewBoard(ReviewBoard reviewboard);

		int insertReviewBoard(ReviewBoard reviewboard);

		List<ReviewBoard> selectBoardList(RowBounds rowBounds);

		int selectCount();

		ReviewBoard selectBoardDetail(int brNo);		
		
		List<Comment> listComment(int brNo);

		int saveComment(Comment comment);

		int getBoardCount_Id(String br_searchword);

		int getBoardCount_Title(String br_searchword);

		int getBoardCount_Content(String br_searchword);

		List<ReviewBoard> getSearchList_Id(RowBounds rowBounds, String br_searchword);

		List<ReviewBoard> getSearchList_Title(RowBounds rowBounds, String br_searchword);

		List<ReviewBoard> getSearchList_Content(RowBounds rowBounds, String br_searchword);

		void updateViewCount(int brViewCount);

		int increateViewcnt(int brNo);

		List<BookScrap> scrapCheck(@Param("bsIsbn") String bsIsbn, @Param("userNo") int userNo);

		int insertScrap(@Param("bsIsbn") String bsIsbn, @Param("userNo") int userNo);

		int deleteScrap(@Param("bsIsbn") String bsIsbn, @Param("userNo") int userNo);

		List<ReviewBoard> selectBoardSortingList(RowBounds rowBounds);

		int deleteBookreview(int brNo); 
		
		// 마이페이지 북리뷰 조회
		List<ReviewBoard> myReviewList(int userNo);
		
		// 마이페이지 스크랩 조회
		List<BookScrap> myScrapList(@Param("rowBounds") RowBounds rowBounds, @Param("userNo") int userNo);

		int myScrapCount(int userNo);

		int increaseReco(int brNo);
		
		//나중에 ajax로 다시 구현 (북타입별 게시판)
		List<ReviewBoard> selectBoardList1(RowBounds rowBounds);
		List<ReviewBoard> selectBoardList2(RowBounds rowBounds);
		List<ReviewBoard> selectBoardList3(RowBounds rowBounds);
		List<ReviewBoard> selectBoardList4(RowBounds rowBounds);
		List<ReviewBoard> selectBoardList5(RowBounds rowBounds);
		List<ReviewBoard> selectBoardList6(RowBounds rowBounds);
}
