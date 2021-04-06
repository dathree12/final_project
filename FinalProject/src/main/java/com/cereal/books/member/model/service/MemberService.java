package com.cereal.books.member.model.service;

import com.cereal.books.member.model.vo.Member;

public interface MemberService {

	int saveMember(Member member);

	int deleteMember(String userId, String userPwd);

}
