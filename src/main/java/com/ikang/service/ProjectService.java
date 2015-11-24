package com.ikang.service;

import java.util.List;
import com.ikang.bean.Project;

public interface ProjectService {
	public List<Project> selectAllProject();
	public Project getProjectById(int id);
	public void addProject(Project project);
	public void updateProject(Project project);
	public void deleteProject(int id);
}
