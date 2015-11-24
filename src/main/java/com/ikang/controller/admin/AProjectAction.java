package com.ikang.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ikang.bean.Project;
import com.ikang.service.ProjectService;
import com.ikang.utils.JsonUtils;

@Controller
@RequestMapping(value = "/admin/Project")
public class AProjectAction {
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping(value = "/projectlist")
	public String projectList(Model model) {
		List<Project> pList = this.projectService.selectAllProject();
		model.addAttribute("projectList", pList);
		return "admin/physical/projectlist";
	}
	
	@RequestMapping(value = "/getProjectById")
	@ResponseBody
	public Object getProjectById(int id) {
		return this.projectService.getProjectById(id);
	}
	
	@RequestMapping(value = "/addProject")
	@ResponseBody
	public String addProject(@RequestBody Project project) {
		this.projectService.addProject(project);
		return JsonUtils.getJson("msg", "success");
	}
	
	@RequestMapping(value = "/saveProject")
	@ResponseBody
	public String saveProject(@RequestBody Project project) {
		this.projectService.updateProject(project);
		return JsonUtils.getJson("msg", "success");
	}
	
	@RequestMapping(value = "/deleteProject")
	@ResponseBody
	public String deleteProject(int id) {
		this.projectService.deleteProject(id);
		return JsonUtils.getJson("msg", "success");
	}
	
}
