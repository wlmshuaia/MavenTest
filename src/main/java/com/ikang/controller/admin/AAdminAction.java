package com.ikang.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ikang.bean.Admin;
import com.ikang.service.AdminService;

@Controller
@RequestMapping(value = "/admin/Admin")
public class AAdminAction {
	
	@Autowired
	private AdminService adminService ;
	
	@RequestMapping(value = "/selectAll")
	public String selectAllAdmin(Model model) {
		List<Admin> aList = this.adminService.selectAllAdmin();
		model.addAttribute("adminList", aList);
		return "admin/rbac/adminlist";
	}
}
