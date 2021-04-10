package com.cereal.books.member.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.cereal.books.member.model.vo.Member;

@Mapper
public interface MemberDao {

	Member selectUserInfoOne(@Param("userId") String userId);
	
	
	int insertMember(Member member);


	Member selectUserNname(@Param("userNname")String userNname);


	int updateMember(Member member);


    int deleteMember(@Param("userId") String userId);


	Member userSerchIdE(@Param("name") String name, @Param("userEmail") String userEmail);


	Member userSerchIdP(@Param("name")String name,  @Param("userPhone") String userPhone);


	Member selectUserEmail(@Param("userEmail")String userEmail);


	Member selectUserPhone(@Param("userPhone") String userPhone);


	Member userSerchPwd(@Param("userId")String userId, @Param("name") String name,  @Param("userEmail") String userEmail);

	void updatePwd(Member member);


	Member selectUserName( @Param("name") String name);




	








	

}
