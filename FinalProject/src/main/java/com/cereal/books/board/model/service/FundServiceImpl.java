package com.cereal.books.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cereal.books.board.model.dao.FundDao;
import com.cereal.books.board.model.vo.FundBoard;
import com.cereal.books.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FundServiceImpl implements FundService {
	
	@Autowired
	private FundDao fundDao;

	@Override
	public int getBoardCount() {
		
		return fundDao.selectCount();
	}

	@Override
	public List<FundBoard> getBoardList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());		
		
		return fundDao.selectBoardList(rowBounds);
	}

	@Override
	public int saveRemainDate() {
		int result = 0;
		result = fundDao.saveRemainDate();
		
		return result;
	}

	@Override
	public int changeStatus() {
		int result = 0;
		result = fundDao.changeStatus();
		
		return result;
	}


	
}
