package com.cereal.books.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cereal.books.board.model.dao.ReviewDao;
import com.cereal.books.board.model.vo.ReviewBoard;

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
		
		if(reviewboard.getBrNo() != 0) {
			result = reviewDao.updateReviewBoard(reviewboard);
		} else {
			result = reviewDao.insertReviewBoard(reviewboard);
		}
		return 0;
	}

}
