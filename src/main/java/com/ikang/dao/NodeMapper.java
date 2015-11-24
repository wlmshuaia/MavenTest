package com.ikang.dao;

import java.util.List;

import com.ikang.bean.Node;

public interface NodeMapper {
	public List<Node> selectAll() ;
	public Node getNodeById(int id) ;
	public void insertNode(Node node);
	public void updateNode(Node node);
	public void deleteNode(int id);
	public List<Node> getNodeByPid(int pid);
}
