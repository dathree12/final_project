package com.cereal.books.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cereal.books.board.model.dao.MainBoardDao;
import com.cereal.books.board.model.vo.ReviewBoard;
import com.cereal.books.common.util.PageInfo;

@Service
public class MainBoardServiceImpl implements MainBoardService {
	@Autowired
	private MainBoardDao mainBoardDao ;

	
	
	@Override
	public int getBoardCount() {
		
		return mainBoardDao.selectCount();
	}



	@Override
	public List<ReviewBoard> getBoardList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit(); 
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
				
		return mainBoardDao.selectBoardList(rowBounds);
	}


}
