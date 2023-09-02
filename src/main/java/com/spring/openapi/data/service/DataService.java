package com.spring.openapi.data.service;

import com.spring.openapi.data.vo.AnimalDaejeonDTO;

public interface DataService {
	
	public StringBuffer chungnamList() throws Exception;
	StringBuffer chungnamDetail(String mng_no) throws Exception;
	StringBuffer animalDaejeonList(AnimalDaejeonDTO dto) throws Exception;
}
