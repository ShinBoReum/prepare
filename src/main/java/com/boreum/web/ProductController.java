package com.boreum.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boreum.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	
	ProductService productService;
	
	public ProductController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="listProduct", method=RequestMethod.GET )
	public String listProduct() throws Exception {
		System.out.println("/product/listProduct : GET");
		
		return "redirect:/product/listProduct.jsp";
	}

}
