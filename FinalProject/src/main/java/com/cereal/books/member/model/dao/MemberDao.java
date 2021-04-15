package com.cereal.books.member.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.cereal.books.member.model.vo.Member;

@Mapper
public interface MemberDao {

	Member selectUserInfoOne(@Param("userId") String userId);
	
	
	int insertMember(Member member);


	Member selectUserNname(@Param("userNname")String userNname);


	int updateMember(Member member);


    int deleteMember(@Param("userId") String userId);


	Member userSearchIdE(@Param("name") String name, @Param("userEmail") String userEmail);


	Member userSearchIdP(@Param("name")String name,  @Param("userPhone") String userPhone);


	Member selectUserEmail(@Param("userEmail")String userEmail);


	Member selectUserPhone(@Param("userPhone") String userPhone);


	Member userSearchPwd(@Param("userId")String userId, @Param("name") String name,  @Param("userEmail") String userEmail);

	void updatePwd(Member member);


	List<Member> selectUserName( @Param("name") String name);

	
	int updatePwd(@Param("userId") String userId, @Param("userPwd") String userPwd);
	
	
	int selectCount(String status);

	
	List<Member> selectMemberList(@Param("rowBounds") RowBounds rowBounds, @Param("status") String status);


	int updateMemberStatus(@Param("status") String status, @Param("userId") List<String> userId);

	








	

}
