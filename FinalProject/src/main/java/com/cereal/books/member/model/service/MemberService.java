package com.cereal.books.member.model.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.cereal.books.common.util.PageInfo;
import com.cereal.books.member.model.vo.Member;

public interface MemberService {

	int saveMember(Member member);

	boolean validate(String userId);

	boolean NnameValidate(String userNname);

	int deleteMember(String userId, String userPwd);

	String searchIdEmail(String name, String userEmail);

	String searchIdPhone(String name, String userPhone);

	boolean emailValidate(String userEmail);

	boolean phoneValidate(String userPhone);

	String findPwd(String userId, String name, String userEmail) throws Exception;
	
	void sendEmail(Member Member, String mail,  String text) throws Exception;

	int updatePwd(String userId, String userPwd);

	int getMemberCount(String status);

	List<Member> getMemberList(PageInfo pageInfo, String status);

	int getMemberStatus(String status, List<String> userId);
}
