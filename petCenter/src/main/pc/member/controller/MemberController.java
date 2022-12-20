package main.pc.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import main.pc.member.service.MemberService;
import main.pc.member.vo.MemberVO;


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
		logger.info("memInsertForm 함수 진입 >>> :");
		return "member/memInsertForm";
	}
	
	//인서트 DB 입력
	@PostMapping("memInsert")
	public String memInsert(HttpServletRequest req, MemberVO mvo, Model model) {
		logger.info("memInsert 함수 진입 >>> :");
		
		String mnum = "0001";
		logger.info("memInsert mnum >>> : " + mnum);
		
		// 회원번호
		mvo.setMnum(mnum);
		// 이름
		// 아이디
		// 비밀번호
		// 휴대폰
		String mhp1 = req.getParameter("mhp1");
		String mhp2 = req.getParameter("mhp2");
		String mhp3 = req.getParameter("mhp3");
		String mhp = mhp1.concat("-").concat(mhp2).concat("-").concat(mhp3);
		mvo.setMhp(mhp);
		// 이메일
		String memail1 = req.getParameter("memail1");
		String memail2 = req.getParameter("memail2");
		String memail = memail1.concat("@").concat(memail2);
		mvo.setMemail(memail);
		// 기호동물
		String[] mpetArr = req.getParameterValues("mpetArr");
		String mpet = String.join(",", mpetArr);
		mvo.setMpet(mpet);
		// 자기소개
		
		return "";
	}
}
