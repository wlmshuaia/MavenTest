package com.ikang.action;

import java.util.List;

import org.junit.Test;

import com.ikang.bean.Admin;
import com.ikang.bean.Hospital;
import com.ikang.bean.Order;
import com.ikang.bean.Project;
import com.ikang.service.AdminService;
import com.ikang.service.HospitalService;
import com.ikang.service.OrderService;
import com.ikang.service.ProjectService;

public class ProjectMTest extends BaseTest {
	
	@Test
	public void selectAllProject() {
		ProjectService pService = (ProjectService) context.getBean("projectService");
		List<Project> pList = pService.selectAllProject();
		System.out.println("count: "+pList.size());
		
		for (int i = 0; i < pList.size(); i++) {
			Project p = pList.get(i);
			System.out.println(p.getName()+", "+p.getPrice());
		}
	}
	
	@Test
	public void selectAllHospital() {
		HospitalService pService = (HospitalService) context.getBean("hospitalService");
		List<Hospital> pList = pService.selectAllHospital();
		
		for (int i = 0; i < pList.size(); i++) {
			Hospital p = pList.get(i);
			System.out.println(p.getName()+", "+p.getAddress());
		}
	}
	
	@Test
	public void selectAllOrder() {
		OrderService pService = (OrderService) context.getBean("orderService");
		List<Order> pList = pService.selectAllOrder();
		
		for (int i = 0; i < pList.size(); i++) {
			Order p = pList.get(i);
			System.out.println(p.getUsername()+", "+p.getCreatetime());
		}
	}
	
	@Test
	public void insertOrder() {
		OrderService pService = (OrderService) context.getBean("orderService");
		
		Order order = new Order();
		order.setUsername("wlm");
		pService.addOrder(order);
	}
	
	@Test
	public void selectAllAdmin() {
		AdminService pService = (AdminService) context.getBean("adminService");
		List<Admin> pList = pService.selectAllAdmin();
		
		for (int i = 0; i < pList.size(); i++) {
			Admin p = pList.get(i);
			System.out.println(p.getAdminname()+", "+p.getPassword());
		}
	}
	
	
}
