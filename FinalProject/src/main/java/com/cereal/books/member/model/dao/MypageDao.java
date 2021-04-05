package com.cereal.books.member.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.cereal.books.member.model.vo.Member;

@Mapper
public interface MypageDao {
	int updateMember(Member member);

	int deleteMember(@Param("id") String id);
}
