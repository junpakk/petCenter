package main.pc.login.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import main.pc.common.K_Session;
import main.pc.login.service.LoginService;
import main.pc.member.vo.MemberVO;

@Controller
public class LoginController {
	Logger logger = LogManager.getLogger(this.getClass());
	
	@Autowired(required=false)
	private LoginService loginService;
	
	// 로그인 폼
	@GetMapping("loginForm")
	public String loginForm() {
		logger.info("loginForm 함수 진입 >>> : ");
		return "login/loginForm";
	}
	
	// 메인페이지
	@GetMapping("mainPage")
	public String mainPage() {
		logger.info("loginForm 함수 진입 >>> : ");
		return "main/mainPage";
	}
	
	// 로그인
	@PostMapping("loginCheck")
	public String loginCheck(HttpServletRequest req, MemberVO mvo) {
		logger.info("loginCheck 함수 진입 >>> : ");
		
		logger.info("loginCheck mvo.getMid()" + mvo.getMid());
		logger.info("loginCheck mvo.getMpw()" + mvo.getMpw());
		
		List<MemberVO> listLogin = loginService.loginCheck(mvo);
		
		if (listLogin.size() == 1) {
			logger.info("loginCheck listLogin.size() >>> : " + listLogin.size());
			
			K_Session ks = K_Session.getInstance();
			String kID = ks.getSession(req);
			
			logger.info("loginCheck kID >>> : " + kID);
			
			if (kID != null && kID.equals(listLogin.get(0).getMid())) {
				logger.info("loginCheck login >>> : 로그인 중 >>> : " + kID);
				return "main/mainPage";
			}else {
				ks.setSession(req, listLogin.get(0).getMid(), listLogin.get(0).getMnum() );
				logger.info("loginCheck login >>> : 세션부여 >>> : " + mvo.getMid());
				return "main/mainPage";
			}
		}
		return "login/loginForm";
	}
	
	@GetMapping("logout")
	public String logout(HttpServletRequest req) {
		logger.info("loginCheck 함수 진입 >>> : ");
		
		K_Session ks = K_Session.getInstance();
		ks.killSession(req);
		
		return "main/mainPage";
	}
	
}
