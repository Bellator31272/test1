package com.spring.admin.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.admin.login.service.AdminLoginService;
import com.spring.admin.login.vo.AdminLoginVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@SessionAttributes("adminLogin")
@RequestMapping("/admin/*")
@Slf4j
public class AdminLoginController {
	
	@Setter(onMethod_ = @Autowired)
	private AdminLoginService adminLoginService;
	
	@GetMapping("/login")
	public String loginForm() {
		return "admin/main";
		
		/**************************************************************
		 * 로그인 처리 메서드
		 * 참고 : 자바단에서 세션의 값을 사용할 경우 로그인을 처리하는 컨트롤러 클래스 위에 
		 * @SessionAttributes("adminLogin") 명시해 준 이름을
		 * 로그인 정보가 필요한 Controller 내 메서드에서 다음과 같이 매개변수를 명시해 주면 된다. 
		 * public 반환형 메서드명(@SessionAttribute("adminLogin") VO클래스명 참조변수)로 
		 * 정의하고 사용하면 된다.
		 * 
		 * RedirectAttributes 객체는 리다이렉트 시점(return "redirect:/경로")에 
		 * 한번만 사용되는 데이터를 전송할 수 있는 addFlashAttribute()라는 기능을 지원한다. 
		 * addFlashAttribute() 메서드는 브라우저까지 전송되기는 하지만, 
		 * URI에는 보이지 않는 숨겨진 데이터의 형태로 전달된다.
		 * redirect:/admin/login?errorMsg=error이라고 전송을 하여야 하는데
		 * 이때 ras.addFlashAttribute("errorMsg", "error"); 
		 * redirect:/admin/login으로 이동
		 **************************************************************/
	}
	@PostMapping("/login")
	public String loginProcess(AdminLoginVO login, Model model, RedirectAttributes ras) {
//		String url = "";
		log.info(""+login);
		AdminLoginVO adminLogin = adminLoginService.loginProcess(login);
		log.info(""+adminLogin);
		if(adminLogin!=null) {
			model.addAttribute("adminLogin", adminLogin);
			// url = "/admin/board/boardList";
		} else {
			ras.addFlashAttribute("errorMsg", "로그인 실패");
			// url = "/admin/login";
		}
		// return "redirect:"+url;
		return "redirect:/admin/login";
	}
	
//	@RequestMapping("/logout")
	@GetMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		log.info("admin 로그아웃");
		sessionStatus.setComplete();
		return "redirect:/admin/login";
	}
}
