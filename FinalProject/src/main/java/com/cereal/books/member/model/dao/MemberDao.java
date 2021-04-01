package com.cereal.books.member.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.cereal.books.member.model.vo.Member;

@Mapper
public interface MemberDao {

	int insertMember(Member member);

	

}
