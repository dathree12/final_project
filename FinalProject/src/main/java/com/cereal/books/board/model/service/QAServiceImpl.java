package com.cereal.books.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cereal.books.board.model.dao.QADao;
import com.cereal.books.board.model.vo.QA;
import com.cereal.books.common.util.PageInfo;

@Service
public class QAServiceImpl implements QAService {

	@Autowired
	QADao dao;

	@Override
	public List<QA> findQAByNo(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		return dao.selectQAList(rowBounds);
	}

	@Override
	public int qaCount() {
		return dao.qaCount();
	}
}
