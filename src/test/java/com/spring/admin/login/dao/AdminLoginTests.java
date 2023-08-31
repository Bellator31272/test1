package com.spring.admin.login.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.spring.admin.login.vo.AdminLoginVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class AdminLoginTests {
	
	@Setter(onMethod_ = @Autowired)
	public AdminLoginDAO adminLoginDAO;
	
	@Test
	public void adminLoginTest() {
		log.info("adminLoginTest() 테스트메서드 실행");
		AdminLoginVO vo = new AdminLoginVO();
		vo.setA_id("id1");
		vo.setA_pwd("1234");
		AdminLoginVO result = adminLoginDAO.loginProcess(vo);
		log.info(result.toString());
	}
}
