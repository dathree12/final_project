package com.cereal.books.board.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.cereal.books.board.model.vo.Comment;
import com.cereal.books.board.model.vo.QA;

@Mapper
public interface QADao {

	int qaCount();

	int insertQA(QA qa);

	int deleteBoard(int qaNo);

	int saveComment(Comment comment);

	QA selectQADetail(int qaNo);

	List<QA> selectQAList(RowBounds rowBounds);

	List<Comment> listComment(int qaNo);

	int increateViewcnt(int qaNo);

}
