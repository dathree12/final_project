package com.cereal.books.common.footer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FooterController {
	
	@RequestMapping("common/agreement/termsGuide")
	public String termsView(){
		
		return "common/agreement/termsGuide";
	}
	
	@RequestMapping("common/agreement/personalGuide")
	public String personalView(){
		
		return "common/agreement/personalGuide";
	}
	
	@RequestMapping("common/agreement/userGuide")
	public String userView(){
		
		return "common/agreement/userGuide";
	}

}
