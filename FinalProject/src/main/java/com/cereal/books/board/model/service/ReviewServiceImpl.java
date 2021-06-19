package com.cereal.books.board.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cereal.books.board.model.dao.ReviewDao;
import com.cereal.books.board.model.vo.BookScrap;
import com.cereal.books.board.model.vo.Comment;
import com.cereal.books.board.model.vo.ReviewBoard;
import com.cereal.books.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired //의존성 주입
	private ReviewDao reviewDao;
	
	@Override
	@Transactional
	public int saveBoard(ReviewBoard reviewboard) {
		int result = 0;
		System.out.println("글쓰기컨트롤러 돌아간다.");
		//System.out.println(reviewboard);
		if(reviewboard.getBrNo() != 0) {
			result = reviewDao.updateReviewBoard(reviewboard);
		} else {
			result = reviewDao.insertReviewBoard(reviewboard);
		}
		return result;
	}

	@Override
	public List<ReviewBoard> getBoardList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());		
		
		return reviewDao.selectBoardList(rowBounds);
	}

	@Override
	public int getBoardCount() {
		
		return reviewDao.selectCount();
	}

	@Override
	public ReviewBoard findBoardByNo(int brNo) {
		return reviewDao.selectBoardDetail(brNo);
	}

	@Transactional
	@Override
	public List<Comment> listComment(int brNo) {
		return reviewDao.listComment(brNo);
	}
	
	@Transactional
	@Override
	public int saveComment(Comment comment) {
		int result = 0;
		result = reviewDao.saveComment(comment);
		return result;
	}

	@Override
	public int getBoardCount_Id(String searchword) {
		return reviewDao.getBoardCount_Id(searchword);
	}

	@Override
	public int getBoardCount_Title(String searchword) {
		return reviewDao.getBoardCount_Title(searchword);
	}

	@Override
	public int getBoardCount_Content(String searchword) {
		return reviewDao.getBoardCount_Content(searchword);
	}

	@Override
	public List<ReviewBoard> getSearchList_Id(PageInfo pageInfo, String searchword) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());	
		
		return reviewDao.getSearchList_Id(rowBounds, searchword);
	}

	@Override
	public List<ReviewBoard> getSearchList_Title(PageInfo pageInfo, String searchword) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());	
		
		return reviewDao.getSearchList_Title(rowBounds, searchword);
	}

	@Override
	public List<ReviewBoard> getSearchList_Content(PageInfo pageInfo, String searchword) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());	
		
		return reviewDao.getSearchList_Content(rowBounds, searchword);
	}

	@Override
	public int increaseViewcnt(int brNo) {
		return reviewDao.increateViewcnt(brNo);
	}

	@Override
	public List<BookScrap> scrapCheck(String bsIsbn, int userNo) {
		
		return reviewDao.scrapCheck(bsIsbn, userNo);
	}

	@Override
	@Transactional
	public int insertScrap(String bsIsbn, int userNo) {
		return reviewDao.insertScrap(bsIsbn, userNo);
	}

	@Override
	@Transactional
	public int deleteScrap(String bsIsbn, int userNo) {
		return reviewDao.deleteScrap(bsIsbn, userNo);
	}

	@Override
	public List<ReviewBoard> getBoardSortingList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());		
		
		return reviewDao.selectBoardSortingList(rowBounds);
	}

	@Override
	public int deleteBookreview(int brNo) {
		
		return reviewDao.deleteBookreview(brNo);
	}
	
	// 마이페이지 리뷰 조회
	@Override
	public List<ReviewBoard> getMyReviewList(int userNo) {
		return reviewDao.myReviewList(userNo);
	}
	
	// 마이페이지 스크랩 조회
	@Override
	public List<BookScrap> getMyScrapList(PageInfo pageInfo,int userNo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());	
		
		return reviewDao.myScrapList(rowBounds, userNo);
	}

	@Override
	public int getMyScrapCount(int userNo) {
		
		return reviewDao.myScrapCount(userNo);
	}

	@Override
	public int saveRecommend(int brNo) {
		return reviewDao.increaseReco(brNo);
	}

	@Override
	public ReviewBoard findBoard(int brNo) {
		return reviewDao.selectBoardDetail(brNo);
	}
	
	//나중에 ajax로 구현해야할 것들
	@Override
	public List<ReviewBoard> getBoardList1(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		return reviewDao.selectBoardList1(rowBounds);
	}

	@Override
	public List<ReviewBoard> getBoardList2(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		return reviewDao.selectBoardList2(rowBounds);
	}

	@Override
	public List<ReviewBoard> getBoardList3(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		return reviewDao.selectBoardList3(rowBounds);
	}

	@Override
	public List<ReviewBoard> getBoardList4(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		return reviewDao.selectBoardList4(rowBounds);
	}

	@Override
	public List<ReviewBoard> getBoardList5(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		return reviewDao.selectBoardList5(rowBounds);
	}

	@Override
	public List<ReviewBoard> getBoardList6(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		return reviewDao.selectBoardList6(rowBounds);
	}

}
