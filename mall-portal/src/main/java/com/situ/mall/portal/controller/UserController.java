package com.situ.mall.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	@RequestMapping("/getLoginPage")
	public String getLoginPage(){
		return "login";
	}

}
