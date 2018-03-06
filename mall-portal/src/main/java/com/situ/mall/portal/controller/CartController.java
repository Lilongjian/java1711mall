package com.situ.mall.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cart")
public class CartController {
	@RequestMapping("/getCartPage")
	public String getCartPage(Integer productId,Integer amount){
		
		return "cart";
	}
	

}
