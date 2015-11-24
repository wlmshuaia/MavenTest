package com.ikang.dao;

import java.util.List;

import com.ikang.bean.Project;

public interface ProjectMapper {
	public List<Project> selectAllProject();
	public Project getProjectById(int id);
	public void insertOneProject(Project project);
	public void deleteProject(int id) ;
	public void updateProject(Project project) ;
}
