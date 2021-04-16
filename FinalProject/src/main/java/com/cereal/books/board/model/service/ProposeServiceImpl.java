package com.cereal.books.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cereal.books.board.model.dao.ProposeDao;
import com.cereal.books.board.model.vo.Propose;
import com.cereal.books.common.util.PageInfo;

@Service
public class ProposeServiceImpl implements ProposeService {

	@Autowired
	ProposeDao dao;

	@Override
	public int getProposeCount() {
		return dao.proposeCount();
	}
	
	@Override
	public List<Propose> getProposeList(PageInfo pageInfo) {
		/*
		 * RowBounds (import org.apache.ibatis.session.RowBounds;)
		 *  1) offset : 데이터를 가져오는 시작점에서 얼마나 떨어진 데이터값인지 의미
		 *  2) limit : 몇 개의 값을 가져올지를 의미한다.
		 */
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return dao.selectProposeList(rowBounds);
	}


	
}
