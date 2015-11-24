package com.ikang.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ikang.bean.Admin;
import com.ikang.service.AdminService;

@Controller
@RequestMapping(value = "/admin/Login")
public class ALoginAction {
	
	@Autowired
	private AdminService adminService ;
	
	@RequestMapping(value = "/login")
	public String login(String adminname, String password, HttpSession session, Model model) {
		Admin a = this.adminService.getAdminByNP(adminname, password);
		
		if(null != a) { // 验证成功
			session.setAttribute("adminname", adminname);
			return "redirect:/admin/Index/index.do";
		}
		model.addAttribute("errorMsg", "用户名或密码错误！");
		
		return "admin/error";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("adminname");
		return "admin/login";
	}
}
