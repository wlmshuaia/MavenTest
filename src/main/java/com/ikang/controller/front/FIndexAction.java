package com.ikang.controller.front;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ikang.bean.Hospital;
import com.ikang.bean.Order;
import com.ikang.bean.Project;
import com.ikang.service.HospitalService;
import com.ikang.service.OrderService;
import com.ikang.service.PackageService;
import com.ikang.service.ProjectService;
import com.ikang.utils.JsonUtils;

@Controller
@RequestMapping(value = "/fIndex")
public class FIndexAction {
	@Autowired
	private HospitalService hospitalService ;
	
	@Autowired
	private PackageService packageService ;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping(value = "/index")
	public String index(Model model) {
		List<Hospital> hList = this.hospitalService.selectAllHospital() ;
		List<com.ikang.bean.Package> pList = this.packageService.selectAllPackage();
		List<Project> projectList = this.projectService.selectAllProject();
		
		model.addAttribute("hostpitalList", hList);
		model.addAttribute("packageList", pList);
		model.addAttribute("projectList", projectList);
		return "index";
	}
	
	@RequestMapping(value = "/orderlist")
	public String orderList(Model model) {
		List<Order> pList = this.orderService.selectAllOrder();
		model.addAttribute("orderList", pList);
		return "admin/physical/orderlist";
	}
	
	@RequestMapping(value = "/addOrder")
	@ResponseBody
//	public String addOrder(@RequestBody int hospital, @RequestBody int pack, @RequestBody Date ordertime, @RequestBody int payType) {
	public String addOrder(@RequestBody Order order) {
		/*Order order = new Order() ;
		order.setUid(1);
		order.setHospital(hospital);
		order.setCid(pack);
		order.setCreatetime(new Date());
		order.setOrdertime(ordertime);
		order.setPaytype(payType);
		*/
		order.setUsername("2333");
		
		float price = 100;
		order.setPrice(price);
		
		order.setStatus("unpaid");
		
		order.setCreatetime(new Date());
		
		this.orderService.addOrder(order);
		return JsonUtils.getJson("msg", "success");
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
