package com.szw.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.szw.pojo.BussElement;
import com.szw.service.BussElementService;

/**
 * 访问方式，如下：
 * http://127.0.0.1:8080/suzhiwei-test/BussElement/findByBussElement
 * @author suzhiwei
 *	要素
 */
@Controller
@RequestMapping("/BussElement")
public class BussElementController {
	@Autowired
	private BussElementService bussElementService;
	/**
	 * 要素展示
	 */
	@RequestMapping("/findByBussElement")
	@ResponseBody
	public ModelAndView findByBussElement(){
		List<BussElement> bussElementList = bussElementService.findByBussElement();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("bussElementList",bussElementList.get(0));
		modelAndView.setViewName("/szw-bussele");
		return modelAndView;
	}
	@RequestMapping("/tests")
	public String tests(HttpServletRequest request) {
		String parameter = request.getParameter("name");
		System.out.println(parameter);
		return "test";
	}
}
