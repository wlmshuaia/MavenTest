package com.ikang.service;

import java.util.List;

import com.ikang.bean.Package;

public interface PackageService {
	public List<Package> selectAllPackage();
	public Package getPackageById(int id);
	public int getCount();
	public void addPackage(Package Package);
	public void updatePackage(Package Package);
	public void deletePackage(int id);
}
