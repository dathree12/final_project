package com.cereal.books.member.model.service;

import javax.servlet.http.HttpServletResponse;

import com.cereal.books.member.model.vo.Member;

public interface MemberService {

	int saveMember(Member member);

	boolean validate(String userId);

	boolean NnameValidate(String userNname);

	int deleteMember(String userId, String userPwd);

	String serchIdEmail(String name, String userEmail);

	String serchIdPhone(String name, String userPhone);

	boolean emailValidate(String userEmail);

	boolean phoneValidate(String userPhone);
	
}
