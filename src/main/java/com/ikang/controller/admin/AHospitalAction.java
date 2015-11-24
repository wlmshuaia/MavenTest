package com.ikang.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ikang.bean.Hospital;
import com.ikang.service.HospitalService;
import com.ikang.utils.JsonUtils;

@Controller
@RequestMapping(value = "/admin/Hospital")
public class AHospitalAction {
	
	@Autowired
	private HospitalService hospitalService;
	
	@RequestMapping(value = "/hospitallist")
	public String HospitalList(Model model) {
		List<Hospital> pList = this.hospitalService.selectAllHospital();
		model.addAttribute("hospitalList", pList);
		return "admin/physical/hospitallist";
	}
	
	@RequestMapping(value = "/getHospitalById")
	@ResponseBody
	public Object getHospitalById(int id) {
		return this.hospitalService.getHospitalById(id);
	}
	
	@RequestMapping(value = "/addHospital")
	@ResponseBody
	public String addHospital(@RequestBody Hospital Hospital) {
		this.hospitalService.addHospital(Hospital);
		return JsonUtils.getJson("msg", "success");
	}
	
	@RequestMapping(value = "/saveHospital")
	@ResponseBody
	public String saveHospital(@RequestBody Hospital Hospital) {
		this.hospitalService.updateHospital(Hospital);
		return JsonUtils.getJson("msg", "success");
	}
	
	@RequestMapping(value = "/deleteHospital")
	@ResponseBody
	public String deleteHospital(int id) {
		this.hospitalService.deleteHospital(id);
		return JsonUtils.getJson("msg", "success");
	}
	
}
