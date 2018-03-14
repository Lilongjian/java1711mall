package com.situ.mall.portal.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.situ.mall.common.response.ServerResponse;
import com.situ.mall.core.constant.Const;
import com.situ.mall.core.entity.Product;
import com.situ.mall.core.entity.Shipping;
import com.situ.mall.core.entity.User;
import com.situ.mall.core.service.IProductService;
import com.situ.mall.core.service.IShippingService;
import com.situ.mall.portal.vo.CartItemVo;
import com.situ.mall.portal.vo.CartVo;

@Controller
@RequestMapping("/order")
public class OrderController {
	private String CART_COOKIE = "cart_cookie";
	@Autowired
	private IProductService productService;
	@Autowired
	private IShippingService shippingService;
   @RequestMapping("/getOrderPage")
   public String getOrderPage(HttpSession session,HttpServletRequest request,Model model){
	   //1.从session中获得user对象
	   User user = (User) session.getAttribute("CURRENT_USER");
	   //2通过user得到收货地址
	  List<Shipping> shippings =  shippingService.selectByUserId(user.getId());
	  System.out.println(shippings);
	  model.addAttribute("shippings", shippings);
	  //3.将cookie里面的购物信息转换为CartVo对象
	  CartVo cartVo = getCartVoFromCookies(request);
	  //将CartItemVo里面的product填满信息，因为现在只有一个id
	  List<CartItemVo> cartItemVos = cartVo.getCartItemVos();
	  //for循环这种方式，remove的时候报错，要用迭代器
	 /* for (CartItemVo cartItemVo : cartItemVos) {
		  if (cartItemVo.getIsChecked()==1) {
		Product product = productService.selectById(cartItemVo.getProduct().getId());
		System.out.println(product);
		cartItemVo.setProduct(product);
		  }
	}*/
	  Iterator<CartItemVo> iterator = cartItemVos.iterator();
	  while (iterator.hasNext()) {
		CartItemVo item = (CartItemVo) iterator.next();
		//没有勾选的移除
		if (item.getIsChecked() == Const.CartChecked.UNCHECKED) {
			iterator.remove();
		}else{
			//勾选的将product更新为详细信息
			Product product = productService.selectById(item.getProduct().getId());
			item.setProduct(product);
		}
		
	}
	  model.addAttribute("cartVo", cartVo);
	   return "order";
   }
   
   
   private CartVo getCartVoFromCookies(HttpServletRequest request) {
		CartVo cartVo = null;
		ObjectMapper objectMapper = new ObjectMapper();
		//只有对象中不为null才转换
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		//将客户端中购物车cookie拿出来
		//springmvc
		Cookie[] cookies = request.getCookies(); 
		if (null != cookies && cookies.length != 0) {
			for (Cookie cookie : cookies) {
				if (CART_COOKIE.equals(cookie.getName())) {//找到了客户端cookie中购物车信息
					String value = cookie.getValue();
					try {
						//将json字符串转换为对象
						cartVo = objectMapper.readValue(value, CartVo.class);
					} catch (JsonParseException e) {
						e.printStackTrace();
					} catch (JsonMappingException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return cartVo;
	}
   
   
   
   @RequestMapping("/addOrder")
   /*@ResponseBody*/
   public String addOrder (){
	   return "apy";
   }
}
