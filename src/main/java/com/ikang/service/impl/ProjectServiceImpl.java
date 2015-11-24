package com.ikang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikang.bean.Project;
import com.ikang.dao.ProjectMapper;
import com.ikang.service.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService{
	@Autowired
	private ProjectMapper projectMapper ;
	
	public List<Project> selectAllProject() {
		return this.projectMapper.selectAllProject();
	}
	
	public Project getProjectById(int id) {
		return this.projectMapper.getProjectById(id);
	}
	
	public void addProject(Project project) {
		this.projectMapper.insertOneProject(project);
	}
	
	public void updateProject(Project project) {
		this.projectMapper.updateProject(project);
	}
	
	public void deleteProject(int id) {
		this.projectMapper.deleteProject(id);
	}
	
}
