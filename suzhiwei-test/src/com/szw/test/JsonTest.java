package com.szw.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * @author suzhiwei
 */
public class JsonTest {
	public static void main(String[] args) {
		//TestMaptoJson();
		breakTest();
	}

	public static void TestMaptoJson() {
		/**
		 * 测试单个map转换的jsonString
		 */
		Map<String, Object> map = new HashMap<>();
		map.put("测试单个1", "测试单个1值");
		map.put("测试单个2", "测试单个2值");
		String jsonStringMap = JSONObject.toJSONString(map);
		System.out.println("map转换后的json值：" +jsonStringMap );
		
		/**
		 * 测试多个map转换的json
		 */
		Map<String, String> map1 = new HashMap<>();
		map1.put("测试多个map1_1", "测试多个map1_1");
		map1.put("测试多个map1_2", "测试多个map1_2");
		Map<String, String> map2 = new HashMap<>();
		map2.put("测试多个map2_1", "测试多个map2_1");
		map2.put("测试多个map2_2", "测试多个map2_2");
		/**
		 * 把map1与map2放入map
		 */
		map.clear();
		map.put("map1", map1);
		map.put("map2", map2);
		String jsonStringMaps = JSONObject.toJSONString(map);
		System.out.println("map转换后的json值：" + jsonStringMaps);
		
		/**
		 * list转换的json
		 */
		ArrayList<Object> list = new ArrayList<>();
		list.add(map);
		String jsonStringlist = JSONObject.toJSONString(list);
		System.out.println("list转换后的json值：" +jsonStringlist);
		
		
		JSONObject parseObject = JSONObject.parseObject(jsonStringMaps);
		System.out.println(parseObject.toString());
		List<?> maps =(List<?>)JSON.parse(jsonStringlist);
		System.out.println(maps.toString());
	}
	
	public static void breakTest() {
		ArrayList<String> arrayList = new ArrayList<>();
		arrayList.add("1");
		arrayList.add("2");
		arrayList.add("3");
		arrayList.add("4");
		arrayList.add("5");
		
		boolean flag = true;
		
		for (String string : arrayList) {
			if("4"==string.toString()) {
				break;
			}
			System.out.println(string.toString());
		}
	}
}
