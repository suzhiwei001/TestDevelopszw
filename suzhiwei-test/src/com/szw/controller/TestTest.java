package com.szw.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestTest {
	@RequestMapping("/testTest")
	public String testTest() {
		return "test";
	}
	@RequestMapping("/szwTree")
	public String szwTree() {
		return "szw-tree";
	}
	@RequestMapping("/test")
	public String szwTree(String path) {
		return path;
	}
	@RequestMapping(value = "/Argumess", method = RequestMethod.POST,produces="application/json;charset=utf-8")
	public String Argumess(String date,String stuNo) {
		System.out.println(date+"----------"+stuNo);
		return "";
	}
	//@RequestMapping(value = "/testTestview", method = RequestMethod.POST,produces="application/json;charset=utf-8")
	@RequestMapping(value = "/testTestview", method = RequestMethod.POST)
	public @ResponseBody String testTestview(HttpServletRequest request,@RequestBody String ss) {
		String parameter = request.getParameter("fq");
		System.out.println(parameter);
		return "test";
	}
}
