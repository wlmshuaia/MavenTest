package com.ikang.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikang.bean.Node;
import com.ikang.dao.NodeMapper;
import com.ikang.service.NodeService;

@Service
public class NodeServiceImpl implements NodeService {
	
	@Autowired
	private NodeMapper nodeMapper ;
	
	/**
	 * 获取所有节点，并组装成map
	 */
//	public Object selectAll() {
//		List<Node> nList = this.nodeMapper.selectAll();
//		
//		List<Map<String, Object>> mapList = new ArrayList<Map<String,Object>>();
//		for(Node n : nList) {
//			if(0 == n.getPid()) {
//				Map<String, Object> oneMap = new HashMap<String, Object>();
//				List<Map<String, Object>> oneList = new ArrayList<Map<String,Object>>();
//				
//				for(Node m : nList) {
//					if(n.getId() == m.getPid()) {
//						Map<String, Object> twoMap = new HashMap<String, Object>();
//						List<Node> twoList = new ArrayList<Node>();
//						for(Node o : nList) {
//							if(m.getId() == o.getPid()) {
//								twoList.add(o); // 添加三级分类
//							}
//						}
//						
//						Map<String, Object> twoChild = new HashMap<String, Object>();
//						twoChild.put("id", m.getId());
//						twoChild.put("remark", m.getRemark());
//						twoChild.put("child", twoList);
//						twoMap.put(m.getName(), twoChild);
//						
//						oneList.add(twoMap); // 添加二级分类
//					}
//				}
//				
//				Map<String, Object> oneChild = new HashMap<String, Object>();
//				oneChild.put("id", n.getId());
//				oneChild.put("remark", n.getRemark());
//				oneChild.put("child", oneList);
//				oneMap.put(n.getName(), oneChild);
//				
//				mapList.add(oneMap); // 添加一级分类
//			}
//		}
//		
//		return mapList ;
//	}
	public Object selectAll() {
		List<Node> nList = this.nodeMapper.selectAll();
		
		Map<String, Object> oneMap = new HashMap<String, Object>();
		
		for(Node n : nList) {
			if(0 == n.getPid()) {
				Map<String, Object> twoMap = new HashMap<String, Object>();
				
				for(Node m : nList) {
					if(n.getId() == m.getPid()) {
						List<Node> twoList = new ArrayList<Node>();
						for(Node o : nList) {
							if(m.getId() == o.getPid()) {
								twoList.add(o); // 添加三级分类
							}
						}
						
						Map<String, Object> threeMap = new HashMap<String, Object>();
						threeMap.put("id", m.getId());
						threeMap.put("remark", m.getRemark());
						threeMap.put("child", twoList);
						twoMap.put(m.getName(), threeMap); // 添加二级分类
					}
				}
				
				Map<String, Object> oneChild = new HashMap<String, Object>();
				oneChild.put("id", n.getId());
				oneChild.put("remark", n.getRemark());
				oneChild.put("child", twoMap);
				oneMap.put(n.getName(), oneChild); // 添加一级分类
			}
		}
		
		return oneMap ;
	}

	public Node getNodeById(int id) {
		return this.nodeMapper.getNodeById(id);
	}

	public void updateNode(Node node) {
		this.nodeMapper.updateNode(node);
	}

	public void insertNode(Node node) {
		this.nodeMapper.insertNode(node);
	}
	
	/**
	 * 递归删除节点
	 */
	public void deleteNode(int id) {
		this.nodeMapper.deleteNode(id);
		
		// 找出该id的所有子分类
		List<Node> oneList = (List<Node>) this.getNodeByPid(id);
		for(Node one : oneList) {
			this.deleteNode(one.getId());
		}
	}

	public List<Node> getNodeByPid(int pid) {
		return this.nodeMapper.getNodeByPid(pid);
	}
}
