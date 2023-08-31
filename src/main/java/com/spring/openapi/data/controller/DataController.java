package com.spring.openapi.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.openapi.data.service.DataService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/data/*")
@Slf4j
public class DataController {
	
	@Setter(onMethod_ = @Autowired)
	private DataService dataService;
	
	@GetMapping("/chungnamView")
	public String chungnamView() {
		log.info("충남 관광 명소 리스트 화면");
		return "data/chungnamView";
	}
	
	@ResponseBody
	@GetMapping(value="/chungnamList", produces="application/xml; charset=UTF-8")
	public String chungnamList() throws Exception{
		log.info("충남 관광 명소 리스트");
		StringBuffer sb = dataService.chungnamList();
		return sb.toString();
	}
	
	@GetMapping(value="/chungnamDetailView")
	public String chungnamDetailView() {
		log.info("충남 관광 명소 상세 페에지 화면");
		return "data/chungnamDetailView";
	}
	
	@GetMapping(value="/chungnamDetail", produces="application/xml; charset=UTF-8")
	@ResponseBody
	public String chungnamDetail(String mng_no) throws Exception{
		log.info("충남 관광 명소 상세 페에지");
		StringBuffer sb = dataService.chungnamDetail(mng_no);;
		return sb.toString();
	}
}