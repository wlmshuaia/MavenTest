package com.ikang.service;

import java.util.List;

import com.ikang.bean.Hospital;

public interface HospitalService {
	
	public List<Hospital> selectAllHospital();
	
	public Hospital getHospitalById(int id);
	
	public int getCount();
	
	public void addHospital(Hospital hospital);
	
	public void updateHospital(Hospital Hospital);
	
	public void deleteHospital(int id);
}
