package com.spring.admin.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.login.dao.AdminLoginDAO;
import com.spring.admin.login.vo.AdminLoginVO;

import lombok.Setter;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {
	
	@Setter(onMethod_ = @Autowired)
	private AdminLoginDAO adminLoginDAO;
	
	@Override
	public AdminLoginVO loginProcess(AdminLoginVO login) {
		AdminLoginVO vo = adminLoginDAO.loginProcess(login); 
		return vo;
	}

}
