package com.ikang.action;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.ikang.bean.Admin;
import com.ikang.bean.Hospital;
import com.ikang.bean.Node;
import com.ikang.bean.Role;
import com.ikang.bean.User;
import com.ikang.service.AdminService;
import com.ikang.service.HospitalService;
import com.ikang.service.NodeService;
import com.ikang.service.RoleService;
import com.ikang.service.UserService;

public class AdminTest extends BaseSpring  {
	
	@Autowired
	private UserService userService ;
	
	@Autowired
	private HospitalService hospitalService;
	
	@Autowired
	private AdminService adminService ;
	
	@Autowired
	private NodeService nodeService ;
	
	@Autowired
	private RoleService roleService;
	
	@Test
	public void selectAllRole() {
		List<Role> nList = this.roleService.selectAll();
		for(Role n : nList) {
			System.out.println(n.getName());
		}
	}
	
	@Test
	public void getNodeByPid() {
		List<Node> nList = this.nodeService.getNodeByPid(16);
		for(Node n : nList) {
			System.out.println(n.getName()+" "+n.getRemark());
		}
	}
	
	@Test
	public void deleteNode() {
		this.nodeService.deleteNode(26);
	}
	
	@Test
	public void insertNode() {
		Node n = new Node();
		
		n.setName("test");
		
		this.nodeService.insertNode(n);
	}
	
	@Test
	public void updateNode() {
		Node n = new Node();
		
		n.setId(18);
		n.setName("2333");
		
		this.nodeService.updateNode(n);
	}
	
	@Test
	public void getNodeById() {
		Node n = this.nodeService.getNodeById(2);
		System.out.println(n.getName());
	}
	
	@SuppressWarnings("unchecked")
	@Test
	public void selectAllNode() {	// map 形式
		Map<String, Object> oneMap = (Map<String, Object>) this.nodeService.selectAll() ;
		
		for(String one : oneMap.keySet()){
			Map<String, Object> twoMap = (Map<String, Object>) oneMap.get(one);
			System.out.println(one+", "+twoMap.get("id")+", "+twoMap.get("remark"));
			
			for(String two : ((Map<String, Object>) twoMap.get("child")).keySet()) {
				Map<String, Object> threeMap = (Map<String, Object>) ((Map<String, Object>) twoMap.get("child")).get(two);
				System.out.println("	"+two + ", "+threeMap.get("id")+", "+ threeMap.get("remark"));
				List<Node> nList = (List<Node>) threeMap.get("child");
				for(Node n : nList) {
					System.out.println("		"+n.getName()+", "+n.getId()+", "+n.getRemark());
				}
			}
		}
		
	}
	
	@Test
	public void NodeTest() {
		long start = System.currentTimeMillis();
		List<Map<String, Object>> mapList = (List<Map<String, Object>>) this.nodeService.selectAll();
		for(Map oneMap : mapList) {
			Set<String> oneKey = oneMap.keySet();
			for(String one : oneKey) {
//				List<Map<String, Object>> oneList = (List<Map<String, Object>>) oneMap.get(one);
				Map<String, Object> oneChild = (Map<String, Object>) oneMap.get(one);
				
				System.out.println(one+" "+oneChild.get("id")+" "+oneChild.get("remark"));
				
				List<Map<String, Object>> oneList = (List<Map<String, Object>>) oneChild.get("child");
				for(Map twoMap : oneList) {
					Set<String> twoKey = twoMap.keySet() ;
					for(String two : twoKey) {
//						List<Node> twoList = (List<Node>) twoMap.get(two);
						
						Map<String, Object> twoChild = (Map<String, Object>) twoMap.get(two);
						
						System.out.println("	"+two + " "+twoChild.get("id")+" "+twoChild.get("remark"));
						
						List<Node> twoList = (List<Node>) twoChild.get("child");
						
						for(Node n : twoList) {
							System.out.println("		"+n.getName()+" "+n.getId()+" "+n.getRemark());
						}
					}
				}
			}
		}
		long end = System.currentTimeMillis();
		System.out.println((end - start));
	}
	
	@Test
	public void selectAllAdmin() {
		List<Admin> aList = this.adminService.selectAllAdmin(); 
		for(Admin a : aList) {
			System.out.println(a.getAdminname()+", "+a.getPassword());
		}
	}
	
	@Test
	public void selectAllUser() {
		List<User> uList = userService.selectAllUser() ;
		for (User u : uList) {
			System.out.println(u.getUsername()+", "+u.getPassword());
		}
	}
	
	@Test
	public void selectUser() {
		User u = userService.selectUser(88);
		System.out.println(u.getUsername()+", "+u.getPassword());
	}
	
	@Test
	public void selectAllHospital() {
		List<Hospital> hList = this.hospitalService.selectAllHospital();
		for (Hospital h : hList) {
			System.out.println(h.getName());
		}
	}
	
	@Test
	public void getAdminByNPTest() {
		Admin a = this.adminService.getAdminByNP("admin", "admin");
		System.out.println(a.getId()+", "+a.getAdminname());
	}
	
}
