package com.cereal.books.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cereal.books.board.model.dao.ClubDao;
import com.cereal.books.board.model.vo.Exp;

@Service
public class ExpServiceImpl implements ExpService {

	@Autowired
	private ClubDao dao;
	
	@Transactional
	@Override
	public int saveExpList(Exp exp) {
		
		int result = 0;
		
		if(exp.getExpNo() != 0) {
//			result = clubDao.updateClub(clubBoard);
			System.out.println("updateClub");
		} else {
			result = dao.insertExp(exp);
		}

		return result;
	}

}
