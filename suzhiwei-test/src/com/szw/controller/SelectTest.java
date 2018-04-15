package com.szw.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/SelectTest")
public class SelectTest {
	@RequestMapping("/SelectTest")
	public String SelectTest1() {
		return "select";
	}
	@RequestMapping("/test")
	public String test1() {
		return "test";
	}
	
	//测试数组越界异常
	//http://127.0.0.1:8080/suzhiwei-test/SelectTest/testSimpleMapingExceptionResolver/?i=15
	@RequestMapping("/testSimpleMapingExceptionResolver")  
	   public String testSimpleMapingExceptionResolver(@RequestParam("i") int i){  
	       String[] values=new String[10]; 
	       System.out.println(values[i]);  
	       return "szw-success";  
	   }

}
