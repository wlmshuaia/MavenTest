package com.ikang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikang.bean.Package;
import com.ikang.dao.PackageMapper;
import com.ikang.service.PackageService;

@Service
public class PackageServiceImpl implements PackageService {
	@Autowired
	private PackageMapper packageMapper ;
	
	public List<Package> selectAllPackage() {
		return this.packageMapper.selectAllPackage();
	}
	
	public Package getPackageById(int id) {
		return this.packageMapper.getPackageById(id);
	}
	
	public int getCount() {
		return this.packageMapper.getCount();
	}
	
	public void addPackage(Package Package) {
		this.packageMapper.insertPackage(Package);
	}
	
	public void updatePackage(Package Package) {
		this.packageMapper.updatePackage(Package);
	}
	
	public void deletePackage(int id) {
		this.packageMapper.deletePackage(id);
	}
}
