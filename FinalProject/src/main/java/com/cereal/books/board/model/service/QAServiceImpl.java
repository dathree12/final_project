package com.cereal.books.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cereal.books.board.model.dao.QADao;
import com.cereal.books.board.model.vo.ClubBoard;
import com.cereal.books.board.model.vo.Comment;
import com.cereal.books.board.model.vo.QA;
import com.cereal.books.common.util.PageInfo;

@Service
public class QAServiceImpl implements QAService {

	@Autowired
	private QADao dao;

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

	@Override
	public QA findQADetail(int qaNo) {
		return dao.selectQADetail(qaNo);
	}

	@Transactional
	@Override
	public int saveBoard(QA qa) {

		int result = 0;

		if (qa.getQaNo() != 0) {
//			result = clubDao.updateQA(qa);
			System.out.println("updateQA");
		} else {
			result = dao.insertQA(qa);
		}

		return result;
	}

	@Transactional
	@Override
	public int deleteBoard(int qaNo) {
		return dao.deleteBoard(qaNo);
	}

	@Transactional
	@Override
	public int saveComment(Comment comment) {
		int result = 0;
		result = dao.saveComment(comment);
		return result;
	}

	@Transactional
	@Override
	public List<Comment> listComment(int qaNo) {
		return dao.listComment(qaNo);
	}
}
