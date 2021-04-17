package com.cereal.books.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.cereal.books.board.model.dao.ReviewDao;
import com.cereal.books.board.model.vo.BookScrap;
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

	@Override
	public int saveScrapStatus(BookScrap bookscrap) {
		int result = 0;
		System.out.println("스크랩 돌아간다.");
		if(bookscrap.getScrapNo() != 0) {
			result = reviewDao.updateBookScrap(bookscrap);
		} else {
			result = reviewDao.insertBookScrap(bookscrap);
		}
		return result;
	}

}
