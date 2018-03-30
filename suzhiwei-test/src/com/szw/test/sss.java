/**
 * 
 */
package com.szw.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.alibaba.fastjson.JSONObject;
import com.szw.pojo.BussElement;
import com.szw.service.BussElementService;

/**
 * @author suzhiwei
 *
 */
public class sss {
public static void main(String[] args) {
	BussElementService bussElementService  =  new BussElementService();
	List<BussElement> findByBussElement = bussElementService.findByBussElement();
	Map<String,Object> hm1 = new HashMap<>();
	
	Map<String,String> hm = new HashMap<>();
	hm.put("ww", "dd");
	hm.put("ddd", "www");
	
	
	
	Map<String,String> hm2 = new HashMap<>();
	hm2.put("ww", "dd");
	hm2.put("ddd", "www");
	hm1.put("ss", hm);
	hm1.put("ss2", hm2);
	String parameter = JSONObject.toJSONString(hm1);
	System.out.println(parameter);
	System.out.println(parameter);
}
}
