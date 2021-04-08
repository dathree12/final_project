package com.cereal.books.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.cereal.books.board.model.dao.ClubDao;
import com.cereal.books.board.model.vo.ClubBoard;

// Dao 한테 쿼리 넘겨주기
public class ClubServiceImpl implements ClubService {
	
	@Autowired
	private ClubDao clubDao;
	
	@Override
	public ClubBoard findByBoardNo(int bcNo) {
		// TODO Auto-generated method stub
		return clubDao.selectClubDetail(bcNo);
	}
}
