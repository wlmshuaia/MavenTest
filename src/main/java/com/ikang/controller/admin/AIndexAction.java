package com.ikang.controller.admin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ikang.service.HospitalService;
import com.ikang.service.PackageService;
import com.ikang.service.UserService;

/**
 * 后台首页
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/admin/Index")
public class AIndexAction {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private HospitalService hospitalService;
	
	@Autowired
	private PackageService packageService;
	
	@RequestMapping(value = "/getStatisticInfo")
	@ResponseBody
	public Object getInfo() {
		int uCount = this.userService.getCount();
		int hCount = this.hospitalService.getCount();
		int pCount = this.packageService.getCount();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userCount", uCount);
		map.put("hospitalCount", hCount);
		map.put("packageCount", pCount);
		return map;
	}
	
	@RequestMapping(value = "/index")
	public String index(Model model) {
		int uCount = this.userService.getCount();
		int hCount = this.hospitalService.getCount();
		int pCount = this.packageService.getCount();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userCount", uCount);
		map.put("hospitalCount", hCount);
		map.put("packageCount", pCount);
		model.addAttribute("infoMap", map);
		return "admin/index";
	}
	
}
