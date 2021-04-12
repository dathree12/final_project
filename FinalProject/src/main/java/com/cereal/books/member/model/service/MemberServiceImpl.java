package com.cereal.books.member.model.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cereal.books.common.util.PageInfo;
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
		
			try {
			sendEmail(member, "enroll", "회원가입");
			} catch (Exception e) {
				e.printStackTrace();
			}
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
	
	public void sendEmail(Member member, String mail, String text ) throws Exception {
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

		if(mail.equals("findpwd")) {
			subject = member.getName() + " 회원님의 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid #f1f1f1;  font-family:verdana'>";
			msg += "<div style='margin: auto;  width: 45%; background-color:  #f1f1f1; font-family:verdana'>";
			msg += "<br><h3 style='color: #f26722; margin: 0px;'>";
			msg += member.getName() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg +=  "<br>";
			msg += "<p>임시 비밀번호 : ";
			msg +=  text + "</p>";
			msg +=  "<br>";
			msg +=  "<br>";
			msg +=  "<br>";
			msg +=  "<h6>상호 : 책스초코</h6>";
			msg +=  "<h6>대표 : 김동민</h6>";
			msg +=  "<h6>전화 : 02-777-7777</h6>";
			msg +=  "<h6>사업자등록번호 : 111-77-77777</h6>";
			msg +=  "<h6>주소 : 경기도 하남시</h6>";
			msg +=  "<h6>개인정보관리책임자 : 김동민(bookschoko@gmail.com)</h6><br><br><br></div>";
			msg +=  "</div>";
			
		}else if(mail.equals("enroll")) {
			Date time = new Date();
			SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd");
			String enrolltime = format.format(time);
			subject = member.getName() + "님 책스초코 회원가입을 축하합니다.";
			msg += "<div align='center' style='border:1px solid #f1f1f1;  font-family:verdana'>";
			msg += "<div style='margin: auto;  width: 45%; background-color:  #f1f1f1; font-family:verdana'>";
			msg += "<br><h3 style='color: #f26722; margin: 0px;'>";
			msg +=  member.getName() + "님 회원가입을 축하합니다.</h3>";
			msg +=  "<br>";
			msg += "<p>아이디 : ";
			msg +=  member.getUserId() + "</p>";
			msg += "<p>닉네임 : ";
			msg +=  member.getUserNname() + "</p>";
			msg += "<p>핸드폰 번호 : ";
			msg +=  member.getUserPhone() + "</p>";
			msg += "<p>주소 : ";
			msg +=  member.getUserAddress() + "</p>";
			msg += "<p>가입 날짜 : ";
			msg +=  enrolltime + "</p>";
			msg +=  "<br>";
			msg +=  "<br>";
			msg +=  "<br>";
			msg +=  "<h6>상호 : 책스초코</h6>";
			msg +=  "<h6>대표 : 김동민</h6>";
			msg +=  "<h6>전화 : 02-777-7777</h6>";
			msg +=  "<h6>사업자등록번호 : 111-77-77777</h6>";
			msg +=  "<h6>주소 : 경기도 하남시</h6>";
			msg +=  "<h6>개인정보관리책임자 : 김동민(bookschoko@gmail.com)</h6><br><br><br></div>";
			msg +=  "</div>";
		}else {
			
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
			
			result ="등록된 아이디가 없습니다.";
			
		}else if(memberDao.selectUserEmail(userEmail) == null ){
			result ="등록된 이메일이 없습니다.";
			
		}else if(memberDao.selectUserName(name)== null ){
			result ="입력하신 이름과 일치하는 계정이 없습니다.";
			
		}else {
			
			String userPwd ="";
			
			for (int i = 0; i < 8; i++) {
				userPwd += (char) ((Math.random() * 26) + 97);
			}
			member.setUserPwd(passwordEncoder.encode(userPwd));
			memberDao.updatePwd(member);
			
			sendEmail(member, "findpwd", userPwd );
			
			result = "이메일로 임시 비밀번호를 발송했습니다.";
		}
		return result;
	}
	
	@Override
	public int updatePwd(String userId, String userPwd) {
		return memberDao.updatePwd(userId, passwordEncoder.encode(userPwd));
	}

	@Override
	public int getMemberCount(String status) {
		return memberDao.selectCount(status);
	}

	@Override
	public List<Member> getMemberList(PageInfo pageInfo, String status) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return memberDao.selectMemberList(rowBounds, status);
	}

	@Override
	public int getMemberStatus(String status, List<String> userId) {
		System.out.println("userId = " + userId);
		return memberDao.updateMemberStatus(status, userId);
	}
	
}


