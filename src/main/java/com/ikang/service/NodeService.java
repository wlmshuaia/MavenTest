package com.ikang.service;

import java.util.List;

import com.ikang.bean.Node;

public interface NodeService {
	public Object selectAll();
	public Node getNodeById(int id);
	public void insertNode(Node node);
	public void updateNode(Node node);
	public void deleteNode(int id);
	public List<Node> getNodeByPid(int pid);
}
