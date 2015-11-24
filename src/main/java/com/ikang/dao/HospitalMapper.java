package com.ikang.dao;

import java.util.List;

import com.ikang.bean.Hospital;

public interface HospitalMapper {
	public List<Hospital> selectAllHospital();
	public Hospital getHospitalById(int id);
	public int getCount() ;
	public void insertHospital(Hospital hospital);
	public void deleteHospital(int id) ;
	public void updateHospital(Hospital hospital) ;
}
