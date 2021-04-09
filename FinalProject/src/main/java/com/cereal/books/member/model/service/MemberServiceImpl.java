package com.cereal.books.member.model.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cereal.books.member.model.dao.MemberDao;
import com.cereal.books.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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

	@Override
	public String serchIdEmail(String name, String userEmail) {
		Member member = memberDao.userSerchIdE(name, userEmail);
		
		if(member != null) {
			String result = member.getUserId();		
			
			return result;
			
		}else {
			return null;
		}
	}

	@Override
	public String serchIdPhone(String name, String userPhone) {
		Member member = memberDao.userSerchIdP(name, userPhone);
		 System.out.println("dPDPD" +  member);
		if(member != null) {
			String result = member.getUserId();		
			
			return result;
			
		}else {
			return null;
		}
	}

	@Override
	public boolean emailValidate(String userEmail) {
		Member member = memberDao.selectUserEmail(userEmail);
		
		return member != null;
	}

	@Override
	public boolean phoneValidate(String userPhone) {
		Member member = memberDao.selectUserPhone(userPhone);
		
		return member != null;
	}
	
	public void sendEmail(Member member, String mail, String pwd ) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "shshnkk4@naver.com";
		String hostSMTPpwd = "book1234!@";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "shshnkk4@naver.com";
		String fromName = "책스초코";
		String subject = "";
		String msg = "";

		if(mail.equals("findpw")) {
			subject = "책스초코 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getName() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg +=  pwd + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String nmail = member.getUserEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); 

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(nmail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	

	@Override
	public String findPwd(String userId, String name, String userEmail) throws Exception {
		Member member = memberDao.userSerchPwd(userId, name, userEmail );
		String result = null;
		if(memberDao.selectUserInfoOne(userId) == null) {
			
			System.out.println("등록된 아이디가 아닙니다");
			
		}else if(memberDao.selectUserEmail(userEmail) == null ){
			System.out.println("등록된 이메일이 아닙니다");
			
		}else {
			
			String userPwd ="";
			
			for (int i = 0; i < 8; i++) {
				userPwd += (char) ((Math.random() * 26) + 97);
			}
			System.out.println("비밇" + userPwd);
			member.setUserPwd(passwordEncoder.encode(userPwd));
			memberDao.updatePwd(member);
			
			sendEmail(member, "findpw", userPwd );
			
			result = userPwd;
		}
		return result;
	}
	
	
}


