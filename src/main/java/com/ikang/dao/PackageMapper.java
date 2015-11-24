package com.ikang.dao;

import java.util.List;

import com.ikang.bean.Package;

public interface PackageMapper {
	public List<Package> selectAllPackage();
	public Package getPackageById(int id);
	public int getCount();
	public void insertPackage(Package Package);
	public void deletePackage(int id) ;
	public void updatePackage(Package Package) ;
}
