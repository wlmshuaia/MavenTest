package com.ikang.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ikang.bean.Package;
import com.ikang.service.PackageService;
import com.ikang.utils.JsonUtils;

@Controller
@RequestMapping(value = "/admin/Package")
public class APackageAction {
	
	@Autowired
	private PackageService PackageService;
	
	@RequestMapping(value = "/packagelist")
	public String packageList(Model model) {
		List<Package> pList = this.PackageService.selectAllPackage();
		model.addAttribute("packageList", pList);
		return "admin/physical/packagelist";
	}
	
	@RequestMapping(value = "/getPackageById")
	@ResponseBody
	public Object getPackageById(int id) {
		return this.PackageService.getPackageById(id);
	}
	
	@RequestMapping(value = "/addPackage")
	@ResponseBody
	public String addPackage(@RequestBody Package Package) {
		this.PackageService.addPackage(Package);
		return JsonUtils.getJson("msg", "success");
	}
	
	@RequestMapping(value = "/savePackage")
	@ResponseBody
	public String savePackage(@RequestBody Package Package) {
		this.PackageService.updatePackage(Package);
		return JsonUtils.getJson("msg", "success");
	}
	
	@RequestMapping(value = "/deletePackage")
	@ResponseBody
	public String deletePackage(int id) {
		this.PackageService.deletePackage(id);
		return JsonUtils.getJson("msg", "success");
	}
	
}
