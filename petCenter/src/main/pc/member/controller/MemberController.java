package main.pc.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MemberController {
	Logger logger = LogManager.getLogger(MemberController.class);


	// 입력
	@RequestMapping(value="kmjSpringMemInsertForm", method=RequestMethod.GET)
	
	public String kmjSpringMemInsertForm() {
		logger.info("kmjSpringMemInsertForm 함수 진입 : ");
		
		return "mem/kmjSpringMemInsertForm";
	}
	
}
