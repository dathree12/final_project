package com.cereal.books.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/common")
public class PaymentController {
	@RequestMapping(value = "/payment", method = {RequestMethod.GET})
	public String payment() {
		
		return "common/payment";
	}

	@RequestMapping(value = "/paySuccess", method = {RequestMethod.GET})
	public String paySuccess() {
		
		return "common/paySuccess";
	}
	
	@RequestMapping(value = "/payFail", method = {RequestMethod.GET})
	public String payFail() {
		
		return "common/payFail";
	}
}
