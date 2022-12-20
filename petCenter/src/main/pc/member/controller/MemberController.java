package main.pc.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import main.pc.member.service.MemberService;


@Controller
public class MemberController {
	Logger logger = LogManager.getLogger(MemberController.class);
	
	// 컨트롤러에서 서비스 필드 오토 와이어드
	@Autowired(required=false)
	private MemberService memberService;
	
	// 컨트롤러에서 채번 서비스 필드 오토 와이어드
//	@Autowired(required=false)
//	private ChabunService chabunService;
	
	//인서트 폼 호출하기
	@GetMapping("memInsertForm")
	public String memInsertForm() {
		logger.info("memInsertForm 함수 진입 : ");
		return "mem/memInsertForm";
	}
	
}
