package com.ikang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikang.bean.Hospital;
import com.ikang.dao.HospitalMapper;
import com.ikang.service.HospitalService;

@Service
public class HospitalServiceImpl implements HospitalService {

	@Autowired
	private HospitalMapper hospitalMapper ;
	
	public List<Hospital> selectAllHospital() {
		return this.hospitalMapper.selectAllHospital();
	}
	
	public Hospital getHospitalById(int id) {
		return this.hospitalMapper.getHospitalById(id);
	}
	
	public int getCount(){
		return this.hospitalMapper.getCount();
	}
	
	public void addHospital(Hospital hospital) {
		this.hospitalMapper.insertHospital(hospital);
	}
	
	public void updateHospital(Hospital Hospital) {
		this.hospitalMapper.updateHospital(Hospital);
	}
	
	public void deleteHospital(int id) {
		this.hospitalMapper.deleteHospital(id);
	}
}
