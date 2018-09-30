package com.szw.test;
/**
 * 写一个程序打印1到100这些数字。
 * 但是遇到数字为3的倍数的时候，打印“Fizz”替代数字，
 * 5的倍数用“Buzz”代替，
 * 既是3的倍数又是5的倍数打印“FizzBuzz”。
 * @author suzhiwei
 */
public class PrintFizzBuzz {
	public static void main(String[] args) {
		fizzBuzz(100);
	}
	/**
	 * 实际使用
	 */
	public static void fizzBuzz(int n) {
		for (int i = 0; i <= n; i++)
			if(i%3 == 0)
				if(i%3 == 0 && i%5 == 0)
					System.out.println(i+"--FizzBuzz");
				else
					System.out.println(i+"--Fizz");
			else if(i%5 == 0)
				System.out.println(i+"--Buzz");
			else
				System.out.println(i);
	}
}
