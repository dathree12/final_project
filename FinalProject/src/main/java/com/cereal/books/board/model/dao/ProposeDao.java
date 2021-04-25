package com.cereal.books.board.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.cereal.books.board.model.vo.ClubBoard;
import com.cereal.books.board.model.vo.Comment;
import com.cereal.books.board.model.vo.Propose;

@Mapper
public interface ProposeDao {

	int selectCount();

	int proposeCount();

	int insertPropose(Propose propose);

	int selectMyAplcClubCount(int userNo);

	int deleteBoard(int proposeNo);

	int saveComment(Comment comment);

	Propose selectPropose(int proposeNo);

	Propose comparePwd(@Param("proposeNo") int proposeNo, @Param("proposePwd") int proposePwd);

	List<Comment> listComment(int proposeNo);

	List<Propose> selectProposeList(RowBounds rowBounds);

	// 마이페이지
	List<Propose> myAplctClubList(@Param("rowBounds") RowBounds rowBounds, @Param("userNo") int userNo);

	int increateViewcnt(int proposeNo);
}
