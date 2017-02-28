package com.eyfast.vipclub.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("/index")
	public String home(HttpServletRequest request, HttpServletResponse response) {
		return "index";
	}
	
	@RequestMapping("/")
	public String index(HttpServletRequest request, HttpServletResponse response) {
		return "index";
	}
}
