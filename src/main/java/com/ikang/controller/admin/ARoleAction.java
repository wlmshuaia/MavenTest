package com.ikang.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ikang.bean.Role;
import com.ikang.service.RoleService;
import com.ikang.utils.JsonUtils;

@Controller
@RequestMapping(value = "/admin/Role")
public class ARoleAction {
	
	@Autowired
	private RoleService roleService ;
	
	@RequestMapping(value = "/selectAll")
	public String selectAllAdmin(Model model) {
		List<Role> aList = this.roleService.selectAll();
		model.addAttribute("roleList", aList);
		return "admin/rbac/rolelist";
	}
	
	@RequestMapping(value = "/getRoleById")
	@ResponseBody
	public Object getRoleById(int id) {
		return this.roleService.getRoleById(id);
	}
	
	@RequestMapping(value = "/addRole")
	@ResponseBody
	public String addRole(@RequestBody Role role) {
		this.roleService.insertRole(role);
		return JsonUtils.getJson("msg", "successs");
	}
	
	@RequestMapping(value = "/deleteRole")
	@ResponseBody
	public String deleteRole(int id) {
		this.roleService.deleteRole(id);
		return JsonUtils.getJson("msg", "successs");
	}
	
	@RequestMapping(value = "/saveRole")
	@ResponseBody
	public String updateRole(@RequestBody Role role) {
		this.roleService.updateRole(role);
		return JsonUtils.getJson("msg", "successs");
	}
	
}
