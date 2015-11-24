package com.ikang.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ikang.bean.Order;
import com.ikang.service.OrderService;

@Controller
@RequestMapping(value = "/admin/Order")
public class AOrderAction {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/orderlist")
	public String HospitalList(Model model) {
		List<Order> pList = this.orderService.selectAllOrder();
		model.addAttribute("orderList", pList);
		return "admin/physical/orderlist";
	}
	
/*	@RequestMapping(value = "/getHospitalById")
	@ResponseBody
	public Object getHospitalById(int id) {
		return this.orderService.getHospitalById(id);
	}
	
	@RequestMapping(value = "/addHospital")
	@ResponseBody
	public String addHospital(@RequestBody Hospital Hospital) {
		this.orderService.addHospital(Hospital);
		return JsonUtils.getJson("msg", "success");
	}
	
	@RequestMapping(value = "/saveHospital")
	@ResponseBody
	public String saveHospital(@RequestBody Hospital Hospital) {
		this.orderService.updateHospital(Hospital);
		return JsonUtils.getJson("msg", "success");
	}
	
	@RequestMapping(value = "/deleteHospital")
	@ResponseBody
	public String deleteHospital(int id) {
		this.orderService.deleteHospital(id);
		return JsonUtils.getJson("msg", "success");
	}*/
	
}
