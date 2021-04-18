package com.cereal.books.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cereal.books.board.model.dao.ExpDao;
import com.cereal.books.board.model.vo.Exp;

@Service
public class ExpServiceImpl implements ExpService {

	@Autowired
	ExpDao dao;
	
	@Transactional
	@Override
	public int saveBoard(Exp exp) {
		
		int result = 0;
		
		if (exp.getExpNo() != 0) {
			// 업데이트
		} else {
			result = dao.insertExp(exp);
		}
		
		return result;
	}

}
