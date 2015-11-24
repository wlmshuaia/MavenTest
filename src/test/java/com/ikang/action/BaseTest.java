package com.ikang.action;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class BaseTest {
	public static ApplicationContext context = null;
	public BaseTest() {
		context = new ClassPathXmlApplicationContext("com/ikang/spring/applicationContext-db.xml") ;
	}
}
