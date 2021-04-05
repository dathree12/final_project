package com.cereal.books.board.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/bc_board")
public class ClubController {

	// 북 클럽 상세페이지
	@RequestMapping("/bcBoardDetail")
	public String clubDetail() {
		
		return "board/bc_board/bcBoardDetail";
	}
	
	//	북 클럽 메인페이지
	@RequestMapping("/bcBoardMain")
	public String clubMain() {
		
		return "board/bc_board/bcBoardMain";
	}
	
	//	북 클럽 제안 리스트
	@RequestMapping("/bcBoardList")
	public String proposeList() {
		
		return "board/bc_board/bcBoardList";
	}
	

	// 북 클럽 제안페이지
	@RequestMapping("/bcBoardPropose")
	public String clubPropose() {

		return "board/bc_board/bcBoardPropose";
	}
	
	// 북 클럽 글쓰기페이지
	@RequestMapping("/bcBoardWrite")
	public String clubWrite() {

		return "board/bc_board/bcBoardWrite";
	}
	
	// 북 클럽 결제페이지
	@RequestMapping("/bcBoardPayment")
	public String clubPayment() {
		
		return "board/bc_board/bcBoardPayment";
	}
	
	/*
	@Controller
	@RequestMapping("/jq")
	public class Jquery {
		
		// 카카오페이 테스트
		@RequestMapping("/kakaopay.cls")
		@ResponseBody
		public String kakaopay() {
			
			try {
				URL address = new URL("https://kapi.kakao.com/v1/payment/ready"); // Host/Mapping_Addr
				HttpURLConnection serverConn = (HttpURLConnection) address.openConnection(); // Server Connection
				serverConn.setRequestMethod("POST");
				serverConn.setRequestProperty("Authorization:", "KakaoAK cb1116471b380d164a7eb0298161a7f5");
				serverConn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8"); 
				serverConn.setDoOutput(true); // DoInput은 default가 true, DoOutput은 default가 false이기 때문에 true(넣어줘야 할 값이 있을 때)
				// 파라미터를 형식에 맞게 작성해야만 제대로 리다이렉트 해준다.
				String parameter = "cid:TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id"
						+ "&item_name=engitem&quantity=1&total_amount=2200&tax_free_amount=200"
						+ "&approval_url=approval_url&cancel_url=cancel_url&fail_url=faul_url";
				OutputStream os = serverConn.getOutputStream(); // 값을 넘기는 역할
				DataOutputStream dos = new DataOutputStream(os); // 데이터를
				dos.writeBytes(parameter); // 어떤 데이터를(바이트로 형변환해서 형식에 맞게)
				dos.flush();
				dos.close();
				
				int result = serverConn.getResponseCode(); // 잘 받았는지 int형으로 보내줌
				InputStream is; // 받는 역할
				
				if (result == 200) {
					// 성공했을 경우
					is = serverConn.getInputStream();
				} else {
					is = serverConn.getErrorStream();
				}
				// InputStream은 받을줄만앎, 받은것을 읽을 줄 아는 InputStreamReader 호출
				InputStreamReader isr = new InputStreamReader(is);
				BufferedReader br = new BufferedReader(isr);
				return br.readLine();
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "{\"result\":\"NO\"}";
		}
	}
	 */

}
