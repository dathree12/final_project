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

		if(member.getUserNo() != 0) {
			result = memberDao.updateMember(member);
		} else {
		member.setUserPwd(passwordEncoder.encode(member.getUserPwd()));
		result = memberDao.insertMember(member);
		}
		return result;
	}

	private Member deleteMember(String userId) {
		return memberDao.selectUserInfoOne(userId);
	}
	
	@Override
	public int deleteMember(String userId, String userPwd) {
		Member member = this.deleteMember(userId);
		
		System.out.println("passwordEncoder.encode() : " + passwordEncoder.encode(userPwd));

		if (member != null && passwordEncoder.matches(userPwd, member.getUserPwd())) {
			return memberDao.deleteMember(userId);
		} else {
			return 0;
		}
	}


	@Override
	public boolean validate(String userId) {
		Member member = memberDao.selectUserInfoOne(userId);
		
		return member != null;
	}


	@Override
	public boolean NnameValidate(String userNname) {
		Member member = memberDao.selectUserNname(userNname);
		
		return member != null;
	}

	
}

