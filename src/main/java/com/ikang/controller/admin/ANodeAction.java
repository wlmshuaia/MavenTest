package com.ikang.controller.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ikang.bean.Node;
import com.ikang.service.NodeService;
import com.ikang.utils.JsonUtils;

@Controller
@RequestMapping(value = "/admin/Node")
public class ANodeAction {
	
	@Autowired
	private NodeService nodeService ;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selectAll")
	public String selectAll(Model model) {
		Map<String, Object> oneMap = (Map<String, Object>) this.nodeService.selectAll();
		model.addAttribute("oneMap", oneMap);
		return "admin/rbac/nodelist";
	}
	
	@RequestMapping(value = "/selectAllJson")
	@ResponseBody
	public Object selectAllJson() {
		return this.nodeService.selectAll();
	}
	
	@RequestMapping(value = "/getNodeById")
	@ResponseBody
	public Object getNodeById(Integer id) {
		Node node = this.nodeService.getNodeById(id);
		return node;
	}
	
	@RequestMapping(value = "/saveNode")
	@ResponseBody
	public String saveNode(@RequestBody Node node) {
		this.nodeService.updateNode(node);
		return JsonUtils.getJson("msg", "success");
	}
	
	@RequestMapping(value = "/addNode")
	@ResponseBody
	public String addNode(@RequestBody Node node) {
		this.nodeService.insertNode(node);
		return JsonUtils.getJson("msg", "success");
	}
	
	@RequestMapping(value = "/deleteNode")
	@ResponseBody
	public String deleteNode(Integer id) {
		this.nodeService.deleteNode(id);
		return JsonUtils.getJson("msg", "success");
	}
	
}
