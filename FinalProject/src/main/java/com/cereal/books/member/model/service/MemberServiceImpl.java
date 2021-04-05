package com.cereal.books.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cereal.books.member.model.dao.MemberDao;
import com.cereal.books.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;


	@Override
	@Transactional
	public int saveMember(Member member) {
		int result = 0;

		member.setUserPwd(passwordEncoder.encode(member.getUserPwd()));
		result = memberDao.insertMember(member);
		return result;
	}


	
}


