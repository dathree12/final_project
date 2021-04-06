package com.cereal.books.member.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.cereal.books.member.model.vo.Member;

@Mapper
public interface MemberDao {

	Member selectUserInfoOne(@Param("userId") String userId);
	
	
	int insertMember(Member member);

	int updateMember(Member member);
	
	int deleteMember(@Param("userId") String userId);
}
