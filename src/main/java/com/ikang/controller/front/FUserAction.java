package com.ikang.controller.front;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ikang.bean.User;
import com.ikang.service.UserService;

@Controller
@RequestMapping("/front/User")
public class FUserAction {
	
	@Resource(name="userService")
	private UserService userService ;
	
//	public void setUserService(UserService userService) {
//		this.userService = userService;
//	}
	
	@RequestMapping("/helloWorld")
	public String helloWorld(User user) {
		user.setUsername("hello world");
		return "hello world" ;
	}
	
	@RequestMapping(value="/user/{username}", method=RequestMethod.GET)
	public String findUser(@PathVariable String username) {
		System.out.println("username: "+username);
		return "" ;
	}
	
//	public String findUserByName(@RequestParam String username) {
	@RequestMapping(value="/findUserByName", method=RequestMethod.POST)
	public String findUserByName(String username) {
		System.out.println("username:"+username);
		return "front/userlist" ;
	}
	
	@RequestMapping(value="/addUser")
	public String addUser(User user) {
		System.out.println(user.getUsername());
		this.userService.insertUser(user);
		return "redirect:/front/User/listUser.do";
	}
	
	@RequestMapping(value="/listUser")
	public String listUser(Model model) {
		List<User> userList = this.userService.selectAllUser();
		model.addAttribute("userList", userList);
		return "front/userlist";
	}
	
	@RequestMapping(value="/deleteUser", method=RequestMethod.GET)
	public String deleteUser(int uid) {
		this.userService.deleteUser(uid);
		return "redirect:/front/User/listUser.do";
	}
	
}
