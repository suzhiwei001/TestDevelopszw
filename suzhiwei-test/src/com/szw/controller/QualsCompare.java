package com.szw.controller;

public class QualsCompare {
public static void main(String[] args) {
	//比较 Integer == 与  equals 区别
	int a = 1000;
	int b = 1000;
	Integer s1 = 1000;
	Integer s2 = 1000;
	System.out.println(s1);
	System.out.println(s2);
	System.out.println(s1==s2);
	System.out.println(s1.equals(s2));
	System.out.println(a==b);
	
}
}
