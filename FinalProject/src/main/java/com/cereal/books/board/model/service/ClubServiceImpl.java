package com.cereal.books.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cereal.books.board.model.dao.ClubDao;
import com.cereal.books.board.model.vo.ClubBoard;
import com.cereal.books.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

// Dao 한테 쿼리 넘겨주기
@Slf4j
@Service
public class ClubServiceImpl implements ClubService {
	
	@Autowired
	private ClubDao clubDao;
	
//	@Override
//	public ClubBoard findByBoardNo(int bcNo) {
//		return clubDao.selectClubDetail(bcNo);
//	}

	@Override
	public int getBoardCount() {
		return clubDao.selectClubCount();
	}

	// 게시판 페이징 처리
	@Override
	public List<ClubBoard> getBoardList(PageInfo pageInfo) {
		/*
		 * RowBounds (import org.apache.ibatis.session.RowBounds;)
		 *  1) offset : 데이터를 가져오는 시작점에서 얼마나 떨어진 데이터값인지 의미
		 *  2) limit : 몇 개의 값을 가져올지를 의미한다.
		 */
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return clubDao.selectClubList(rowBounds);
	}

	@Override
	public ClubBoard findClubByNo(int bcNo) {
		// 클럽게시판번호로 게시판의 정보를 가져온다
		return clubDao.selectClubDetail(bcNo);
	}
}
