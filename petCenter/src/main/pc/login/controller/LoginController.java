package main.pc.login.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import main.pc.common.EncryptSHA;
import main.pc.common.GoogleAuthumMail;
import main.pc.common.K_Session;
import main.pc.common.PasswordUtil;
import main.pc.login.service.LoginService;
import main.pc.login.vo.IdFindVO;
import main.pc.login.vo.PwFindVO;
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
		
		logger.info("loginCheck mvo.getMid() >>> : " + mvo.getMid());
		
		String mpw = EncryptSHA.encryptSHA256(mvo.getMpw());
		mvo.setMpw(mpw);
		logger.info("loginCheck mvo.getMpw() >>> : " + mvo.getMpw());
		
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
	
	// 아이디 찾기 ================================================== start
	
	@GetMapping("idFindForm")
	public String idFindForm() {
		logger.info("idFindForm 함수 진입 >>> : ");
		return "login/idFind";
	}
	
	// 아이디찾기 인증번호
	@GetMapping("idFindAuthnum")
	public String idFindAuthnum(MemberVO mvo) {
		logger.info("idFindAuthnum 함수 진입 >>> : ");
		
		// 이메일 체크 서비스 호출
		List<MemberVO> emailCnt = loginService.emailCntCheck(mvo);
		
		if (emailCnt.size() == 1) {
			String authnum = PasswordUtil.tempPW(8);
			
			IdFindVO avo = null;
			avo = new IdFindVO();
			avo.setAuthnum(authnum);
			avo.setMemail(mvo.getMemail());
			int nCnt = loginService.tempAuthInsert(avo);
			
			if (nCnt == 1) {
				
				String resiveMail = avo.getMemail();
				String sendMsg = "임시 인증번호 :::: " + avo.getAuthnum();
				GoogleAuthumMail gam = new GoogleAuthumMail();
				gam.authumMail(resiveMail, sendMsg);
				return "login/emailCheck";
			}
		}
		return "login/idFind";
	}
	
	// 아이디 찾아서 받기
	@PostMapping("idFind")
	public String idFind(MemberVO mvo, IdFindVO avo, Model model) {
		logger.info("idFind 함수 진입 >>> : ");
		logger.info("idFind avo.getAuthnum() >>> : " + avo.getAuthnum());
		logger.info("idFind avo.getMemail() >>> : " + avo.getMemail());
		logger.info("idFind mvo.getMname() >>> : " + mvo.getMname());
		
		// 아이디 인증 번호 확인
		List<IdFindVO> authnumFind = loginService.idFindAuthnum(avo);
		
		if (authnumFind.size() == 1) {
			
			// 아이디 확인 서비스 호출
			List<MemberVO> midFind = loginService.idFind(mvo);
			
			if (midFind.size() == 1) {
				model.addAttribute("midFind", midFind);
				return "login/idFindOK";
			}
		}
		return "login/idFind";
	}
	
	// 아이디 찾기 ================================================== end
	
	// 패스워드 찾기 ================================================== start
	
	@GetMapping("pwFindForm")
	public String pwFindForm() {
		logger.info("pwFindForm 함수 진입 >>> : ");
		return "login/pwFind";
	}
	
	// 아이디찾기 인증번호
	@GetMapping("pwFindAuthnum")
	public String pwFindAuthnum(MemberVO mvo) {
		logger.info("pwFindAuthnum 함수 진입 >>> : ");
		
		// 이메일 체크 서비스 호출
		List<MemberVO> emailCnt = loginService.emailCntCheckPW(mvo);
		
		if (emailCnt.size() == 1) {
			String temppw = PasswordUtil.tempPW(8);
			
			PwFindVO pvo = null;
			pvo = new PwFindVO();
			pvo.setPpw(temppw);
			pvo.setMid(mvo.getMid());
			pvo.setMemail(mvo.getMemail());
			
			int nCnt = loginService.tempPwInsert(pvo);
			
			if (nCnt == 1) {
				
				String resiveMail = pvo.getMemail();
				String sendMsg = "임시 비밀번호 :::: " + pvo.getPpw();
				GoogleAuthumMail gam = new GoogleAuthumMail();
				gam.authumMail(resiveMail, sendMsg);
				return "login/emailCheckPW";
			}
		}
		return "login/pwFind";
	}
		
	// 임시 비밀번호 찾아서 받기
	@PostMapping("pwFind")
	public String pwFind(PwFindVO pvo, Model model) {
		logger.info("pwFind 함수 진입 >>> : ");
		logger.info("pwFind pvo.getAuthnum() >>> : " + pvo.getPpw());
		logger.info("pwFind pvo.getMemail() >>> : " + pvo.getMemail());
		logger.info("pwFind pvo.getMid() >>> : " + pvo.getMid());
		
		// 임시 비밀번호 확인
		List<PwFindVO> authnumFind = loginService.pwFindAuthnum(pvo);
		
		if (authnumFind.size() == 1) {
			
			// 임시비밀번호 확인했을때 새 비번 입력사이트 이동
			model.addAttribute("mid", pvo.getMid());
			model.addAttribute("memail", pvo.getMemail());
			return "member/memPwUpdateForm";
			
		}
		return "login/pwFind";
	}
	
	// 패스워드 찾기 ================================================== end
	
	// 카카오 로그인 ================================================== start
	@PostMapping("kakaoLogin")
	public String kakaoLogin(HttpServletRequest req, MemberVO mvo) {
		logger.info("kakaoLogin 함수 진입 >>> : ");
		
		logger.info("kakaoLogin mvo.getSnstype() >>> : " + mvo.getSnstype());
		logger.info("kakaoLogin mvo.getSnsid() >>> : " + mvo.getSnsid());
		logger.info("kakaoLogin mvo.getSnsemail() >>> : " + mvo.getSnsemail());
		
		// sns 입력시 기존 not null 컬럼을 처리하기 
		String mid = "kakao : " + mvo.getSnsid();
		String mpw = EncryptSHA.encryptSHA256(EncryptSHA.encryptSHA256(PasswordUtil.tempPW(8)));
		String memail = mvo.getSnsemail();
		
		logger.info("kakaoLogin mid >>> : " + mid);
		logger.info("kakaoLogin mpw >>> : " + mpw);
		logger.info("kakaoLogin memail >>> : " + memail);
		
		mvo.setMid(mid);
		mvo.setMpw(mpw);
		mvo.setMemail(memail);
		
		List<MemberVO> kList = loginService.kakaoLogin(mvo);
		int kCnt = kList.size();
		logger.info("kakaoLogin kCnt >>> : " + kCnt);
		int insertCnt = 0;
		
		if(kCnt == 0) {// 셀렉트 0 -> 회원아님 -> 회원가입
			insertCnt = loginService.kakaoInsert(mvo);
			logger.info("kakaoLogin insertCnt >>> : " + insertCnt);
			
			// 회원가입후 다시 셀렉트
			kList = loginService.kakaoLogin(mvo);
			kCnt = kList.size();
			logger.info("kakaoLogin kCnt after >>> : " + kCnt);
		}
		
		if (kCnt == 1) {
			
			K_Session ks = K_Session.getInstance();
			String kID = ks.getSession(req);
			
			logger.info("kakaoLogin kID >>> : " + kID);
			
			if (kID != null && kID.equals(kList.get(0).getMid())) {
				logger.info("loginCheck login >>> : 로그인 중 >>> : " + kID);
				return "main/mainPage";
			}else {
				ks.setSession(req, kList.get(0).getMid(), kList.get(0).getMnum() );
				logger.info("loginCheck login >>> : 세션부여 >>> : " + mvo.getMid());
				return "main/mainPage";
			}
		}
		
		logger.info("kakaoLogin() >>> : 로그인실패");
		return "login/loginForm";
	}
	
	// 카카오 로그인 ================================================== end
	
	// 네이버 로그인 ================================================== start
	
	
	
	// 네이버 로그인 ================================================== end
}
