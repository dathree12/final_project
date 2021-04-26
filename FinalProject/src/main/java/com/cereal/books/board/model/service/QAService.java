package com.cereal.books.board.model.service;

import java.util.List;

import com.cereal.books.board.model.vo.Comment;
import com.cereal.books.board.model.vo.QA;
import com.cereal.books.common.util.PageInfo;

public interface QAService {

	int qaCount();

	int saveBoard(QA qa);

	int deleteBoard(int qaNo);

	int saveComment(Comment comment);

	QA findQADetail(int qaNo);

	List<QA> findQAByNo(PageInfo pageInfo);

	List<Comment> listComment(int qaNo);

	int increaseViewcnt(int qaNo);

}
