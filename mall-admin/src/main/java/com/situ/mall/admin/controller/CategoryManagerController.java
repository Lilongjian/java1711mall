package com.situ.mall.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.common.response.ServerResponse;
import com.situ.mall.core.entity.Category;
import com.situ.mall.core.entity.User;
import com.situ.mall.core.mapper.CategoryMapper;
import com.situ.mall.core.service.ICategoryService;

@Controller
@RequestMapping("/category")
public class CategoryManagerController {
     @Autowired
     private ICategoryService categoryService;
     
     @RequestMapping("/selectTopCategory")
     @ResponseBody
     public ServerResponse selectTopCategory(){
    	 return categoryService.selectTopCategory();
     }
     @RequestMapping("/selectSecondCategory")
     @ResponseBody
     public ServerResponse selectSecondCategory(Integer topCategoryId){
    	 return categoryService.selectSecondCategory(topCategoryId);
     }
     @RequestMapping("/getCategoryPage")
	 	public String getUserPage() {
	 		return "category_list";
	 	}
     
     @RequestMapping("/pageList")
	 	@ResponseBody
	 	public ServerResponse<List<Category>> pageList(Integer page, Integer limit,Category name) {
	 		return categoryService.pageList(page, limit,name);
	 	}
	
	 	
	 
}
