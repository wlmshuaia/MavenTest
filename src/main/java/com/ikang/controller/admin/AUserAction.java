package com.ikang.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ikang.bean.User;
import com.ikang.service.UserService;
import com.ikang.utils.DataUtils;
import com.ikang.utils.JsonUtils;

@Controller
@RequestMapping("/admin/User")
public class AUserAction {
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/userlist", method=RequestMethod.GET)
	public String userList(Integer page, Model model) {
//		List<User> uList = this.userService.selectAllUser();
		int pageStart = (page - 1) * DataUtils.PAGE_NUM;
		int count = this.userService.getCount();
		
		List<User> uList = this.userService.selectUserLimit(pageStart, DataUtils.PAGE_NUM);
		model.addAttribute("userList", uList);
		
		/* 计算分页相关属性 */
		Map<String, Object> pageMap = new HashMap<String, Object>() ;
		
		// 总页数
		int total = count / DataUtils.PAGE_NUM ;
		total = count % DataUtils.PAGE_NUM == 0 ? total : (total + 1); 
		int pStart = 1; // 显示起始页
		int pEnd = total ; // 显示结束页
		
		int gap = DataUtils.PAGE_GAP ;
		
		if(page - gap > 0) {
			pStart = page - gap;
		}
		
		if(page + gap < total) {
			pEnd = pStart + gap;
		}
		
		pageMap.put("pStart", pStart);
		pageMap.put("pEnd", pEnd);
		pageMap.put("total", total);
		pageMap.put("curr", page);
		
		model.addAttribute("pageMap", pageMap);
		return "admin/user/userlist";
	}
	
	@RequestMapping(value = "/addUser", method=RequestMethod.POST)
	@ResponseBody
	public String addUser(@RequestBody User user) {
		this.userService.insertUser(user);
		return JsonUtils.getJson("msg", "success");
	}
	
	@RequestMapping(value = "/deleteUser")
	@ResponseBody
	public String deleteUser(int id) {
		this.userService.deleteUser(id);
		return JsonUtils.getJson("msg", "success");
	}
	
	@RequestMapping(value = "/getUserById")
	@ResponseBody
	public Object getUserById(int id) {
		User u = this.userService.selectUser(id);
		return u;
	}
	
	@RequestMapping(value = "/saveUser", method=RequestMethod.POST)
	@ResponseBody
	public Object updateUser(@RequestBody User user) {
		this.userService.updateUser(user);
		return JsonUtils.getJson("msg", "success");
	}
	
}
