package com.ikang.action;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ikang.bean.User;
import com.ikang.dao.UserMapper;
import com.ikang.service.UserService;
import com.ikang.utils.MybatisUtil;

public class SqlSessionTest {
	private SqlSession session = null ;
	private UserMapper um = null ;
	public SqlSessionTest() {
		session = MybatisUtil.getSession() ;
		um = session.getMapper(UserMapper.class);
	}
	
	@Test
	public void selectUser() {
		User u = um.selectUser(88) ;
		System.out.println(u.getUsername()+", "+u.getPhone());
	}
	
	@Test
	public void selectAllUser() {
		List<User> uList = um.selectAllUser();
		for (int i = 0; i < uList.size(); i++) {
			User u = uList.get(i);
			System.out.println(u.getUsername()+", "+u.getPassword());
		}
	}
	
	@Test
	public void selectUserLimit() {
		List<User> uList = um.selectUserLimit(1, 3);
		for (int i = 0; i < uList.size(); i++) {
			User u = uList.get(i);
			System.out.println(u.getUsername()+", "+u.getPassword());
		}
	}
	
	@Test
	public void insertUser() {
		User u = new User() ;
		
//		for(int i = 0; i < 10; i ++) {
			u.setUsername("翁列苗");
			u.setPassword("123");
			um.insertOneUser(u);//插入操作
			session.commit();
//		}
		
//		System.out.println("插入前主键为："+u.getId());
//		um.insertOneUser(u);//插入操作
//		session.commit();
//		System.out.println("插入后主键为："+u.getId());
	}

	@Test
	public void updateUser() {
		User u = new User() ;
		u.setId(39);
		u.setUsername("wlmssss");
		
		um.updateUser(u);
		session.commit();
	}
	
	@Test
	public void deleteUser() {
		um.deleteUser(37) ;
		session.commit();
	}
	
	@Test
	public void testUserService() {
		ApplicationContext context = new ClassPathXmlApplicationContext("com/ikang/spring/applicationContext.xml") ;
//		SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) context.getBean("sqlSessionFactory") ;
//		UserMapper userMapper = (UserMapper) context.getBean("userMapper");
//		User u = userMapper.selectUser(1) ;
//		System.out.println(u.getUsername());
		
		UserService us = (UserService) context.getBean("userService") ;
		User u = us.selectUser(88) ;
		System.out.println(u.getUsername());
	}
	
	@After
	public void after() {
		session.close();
	}
}
