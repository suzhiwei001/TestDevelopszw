package com.szw.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author suzhiwei 统一认证
 */
@Controller
@RequestMapping("/login")
public class Szw_UnifiedAuthentication {
	/**
	 * 用于跳转到登录页面
	 */
	@RequestMapping("/loginPage")
	public String loginPage() {
		return "szw_login";
	}
	/**
	 * 用户登录
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest request,HttpServletResponse response) {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		System.out.println(name+"-----"+password);
		setCookieLogin(request, response, name, password);
		getCookieLogin(request);
		return "szw_login";
	}
	/**
	 * 设置浏览器cookie
	 * @param request
	 * @param response
	 * @param name
	 * @param password
	 */
	public void setCookieLogin(HttpServletRequest request,HttpServletResponse response, String name,String password) {
		Cookie cookie = new Cookie(name,password);
		response.addCookie(cookie);
	}
	/**
	 * 获取浏览器的cookie
	 * @param request
	 */
	public void getCookieLogin(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			System.out.println(cookie.toString());
		}
	}
}
