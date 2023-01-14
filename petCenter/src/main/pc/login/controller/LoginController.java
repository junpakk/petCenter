package main.pc.login.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.pc.common.EncryptSHA;
import main.pc.common.GoogleAuthumMail;
import main.pc.common.K_Session;
import main.pc.common.PasswordUtil;
import main.pc.login.service.LoginService;
import main.pc.login.vo.IdFindVO;
import main.pc.login.vo.PwFindVO;
import main.pc.member.service.MemberService;
import main.pc.member.vo.MemberVO;

@Controller
public class LoginController {
	Logger logger = LogManager.getLogger(this.getClass());
	
	// 컨트롤러에서 로그인서비스 필드 오토 와이어드
	@Autowired(required=false)
	private LoginService loginService;
	
	// 컨트롤러에서 멤버서비스 필드 오토 와이어드
	@Autowired(required=false)
	private MemberService memberService;
	
	// 로그인 폼
	@GetMapping("loginForm")
	public String loginForm() {
		logger.info("loginForm 함수 진입 >>> : ");
		return "login/loginForm";
	}
	
	// 차트 제이슨파일 만들기
	@GetMapping("chartdata")
	public String chartdata() {
		logger.info("chartdata 함수 진입 >>> : ");
		return "main/chartdata";
	}
	// 메인페이지
	@GetMapping("mainPage")
	public String mainPage() {
		logger.info("loginForm 함수 진입 >>> : ");
		return "main/mainPage";
	}
	
	// 로그인
	@PostMapping("loginCheck")
	@ResponseBody
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
				return "loginSuccess";
			}else {
				ks.setSession(req, listLogin.get(0).getMid(), listLogin.get(0).getMnum() );
				logger.info("loginCheck login >>> : 세션부여 >>> : " + mvo.getMid());
				return "loginSuccess";
			}
		}
		return "loginFail";
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
	
	// 임시비밀번호 발급
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
		String mid = "";
		String mpw = "";
		String memail = "";
		
		List<MemberVO> kList = loginService.snsLogin(mvo);
		int kCnt = kList.size();
		logger.info("kakaoLogin kCnt >>> : " + kCnt);
		int insertCnt = 0;
		
		if(kCnt == 0) {// 셀렉트 0 -> 회원아님 -> 회원가입
			
			while(true) {
				mid = "kakao" + PasswordUtil.randomPW(15);
				mvo.setMid(mid);
				List<MemberVO> list = memberService.memIdCheck(mvo);
				if(list.size() == 0) {
					break;
				}
			}
			
			mpw = EncryptSHA.encryptSHA256(EncryptSHA.encryptSHA256(PasswordUtil.tempPW(8)));
			mvo.setMpw(mpw);
			
			memail = mvo.getSnsemail();
			mvo.setMemail(memail);
			
			logger.info("kakaoLogin mvo.getMid() >>> : " + mvo.getMid());
			logger.info("kakaoLogin mvo.getMpw() >>> : " + mvo.getMpw());
			logger.info("kakaoLogin mvo.getMemail() >>> : " + mvo.getMemail());
			
			insertCnt = loginService.snsInsert(mvo);
			logger.info("kakaoLogin insertCnt >>> : " + insertCnt);
			
			// 회원가입후 다시 셀렉트
			kList = loginService.snsLogin(mvo);
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
	
	// 구글 로그인 ================================================== start
	@PostMapping("googleLogin")
	public String googleLogin(HttpServletRequest req, MemberVO mvo) {
		logger.info("googleLogin 함수 진입 >>> : ");
		logger.info("googleLogin mvo.getSnstype() >>> : " + mvo.getSnstype());
		logger.info("googleLogin mvo.getSnsid() >>> : " + mvo.getSnsid());
		logger.info("googleLogin mvo.getSnsemail() >>> : " + mvo.getSnsemail());
		
		// sns 입력시 기존 not null 컬럼을 처리하기 
		String mid = "";
		String mpw = "";
		String memail = "";
		
		List<MemberVO> gList = loginService.snsLogin(mvo);
		int gCnt = gList.size();
		logger.info("googleLogin gCnt >>> : " + gCnt);
		int insertCnt = 0;
		
		if(gCnt == 0) {// 셀렉트 0 -> 회원아님 -> 회원가입
			
			while(true) {
				mid = "google" + PasswordUtil.randomPW(14);
				mvo.setMid(mid);
				List<MemberVO> list = memberService.memIdCheck(mvo);
				if(list.size() == 0) {
					break;
				}
			}
			
			mpw = EncryptSHA.encryptSHA256(EncryptSHA.encryptSHA256(PasswordUtil.tempPW(8)));
			mvo.setMpw(mpw);
			
			memail = mvo.getSnsemail();
			mvo.setMemail(memail);
			
			logger.info("googleLogin mvo.getMid() >>> : " + mvo.getMid());
			logger.info("googleLogin mvo.getMpw() >>> : " + mvo.getMpw());
			logger.info("googleLogin mvo.getMemail() >>> : " + mvo.getMemail());
			
			insertCnt = loginService.snsInsert(mvo);
			logger.info("googleLogin insertCnt >>> : " + insertCnt);
			
			// 회원가입후 다시 셀렉트
			gList = loginService.snsLogin(mvo);
			gCnt = gList.size();
			logger.info("googleLogin gCnt after >>> : " + gCnt);
		}
		
		if (gCnt == 1) {
			
			K_Session ks = K_Session.getInstance();
			String kID = ks.getSession(req);
			
			logger.info("googleLogin kID >>> : " + kID);
			
			if (kID != null && kID.equals(gList.get(0).getMid())) {
				logger.info("loginCheck login >>> : 로그인 중 >>> : " + kID);
				return "main/mainPage";
			}else {
				ks.setSession(req, gList.get(0).getMid(), gList.get(0).getMnum() );
				logger.info("loginCheck login >>> : 세션부여 >>> : " + mvo.getMid());
				return "main/mainPage";
			}
		}
		
		logger.info("googleLogin() >>> : 로그인실패");
		return "login/loginForm";
	}
	// 구글 로그인 ================================================== end
	
	// 네이버 로그인 ================================================== start
	@GetMapping("naverCallback")
	public String naverCallback() {
		logger.info("naverCallback 함수 진입 >>> : ");
		return "login/naverCallback";
	}
	
	@GetMapping("naverLogin")
	public String naverLogin(HttpServletRequest req, Model model) {
		logger.info("naverLogin 함수 진입 성공 >>> : ");

		String access_token = (String) req.getAttribute("access_token");
		logger.info("naverLogin access_token >>> : " + access_token);
		
		String token = access_token;
		String header = "Bearer " + token;
		String apiURL = "https://openapi.naver.com/v1/nid/me";
		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("Authorization", header);
		String responseBody = get(apiURL, requestHeaders);
		logger.info("responseBody >>> : " + responseBody);
		//위에 값을 콘솔로 찍어본다. name 값이 유니코드인데 
		// 브라우저에서 자동으로 변환해서 읽고 json simple 라이브러리가 변환해준다.
		
		JSONObject jobj = new JSONObject();
		JSONParser parser = new JSONParser();
		MemberVO mvo = new MemberVO();
		
		String snsid = "";
		String snsemail = "";
		String mname = "";
		String mhp = "";
		
		try {
			jobj = (JSONObject)parser.parse(responseBody);
			
			// resultCode가 00이고 message success이면 실행
			String resultcode = (String)jobj.get("resultcode");
			String message = (String)jobj.get("message");
			
			//여기서 response가 json객체 안에 json객체
			jobj = (JSONObject)jobj.get("response");
			
			snsid = (String)jobj.get("id");
			snsemail = (String)jobj.get("email");
			mname = (String)jobj.get("name");
			mhp = (String)jobj.get("mobile");
			
			logger.info("naverLogin snsid >>> : " + snsid);
			logger.info("naverLogin snsemail >>> : " + snsemail);
			logger.info("naverLogin mname >>> : " + mname);
			logger.info("naverLogin mhp >>> : " + mhp);
			
		}catch(Exception e) {
			logger.info("네이버 로그인 실패" + e.getMessage());
			return "login/loginForm";
		}
		
		// sns 입력시 기존 not null 컬럼을 처리하기 
		String mid = "";
		String mpw = "";
		String memail = "";
		
		mvo.setSnstype("02");
		mvo.setSnsid(snsid);
		mvo.setSnsemail(snsemail);
		
		List<MemberVO> nList = loginService.snsLogin(mvo);
		int nCnt = nList.size();
		logger.info("naverLogin nCnt >>> : " + nCnt);
		int insertCnt = 0;
		
		if(nCnt == 0) {// 셀렉트 0 -> 회원아님 -> 회원가입
		
			while(true) {
				mid = "naver" + PasswordUtil.randomPW(15);
				mvo.setMid(mid);
				List<MemberVO> list = memberService.memIdCheck(mvo);
				if(list.size() == 0) {
					break;
				}
			}
			
			mpw = EncryptSHA.encryptSHA256(EncryptSHA.encryptSHA256(PasswordUtil.tempPW(8)));
			mvo.setMpw(mpw);
			logger.info("naverLogin mpw >>> : " + mpw);
			
			memail = snsemail;
			mvo.setMemail(memail);
			logger.info("naverLogin memail >>> : " + memail);
			
			if(mhp != null && mhp.length() > 0) mvo.setMhp(mhp);
			if(mname != null && mname.length() > 0) mvo.setMname(mname);
			
			insertCnt = loginService.snsInsert(mvo);
			logger.info("naverLogin insertCnt >>> : " + insertCnt);
		
			// 회원가입후 다시 셀렉트
			nList = loginService.snsLogin(mvo);
			nCnt = nList.size();
			logger.info("naverLogin kCnt after >>> : " + nCnt);
		}
		
		if (nCnt == 1) {
			
			K_Session ks = K_Session.getInstance();
			String kID = ks.getSession(req);
			
			logger.info("naverLogin kID >>> : " + kID);
			
			if (kID != null && kID.equals(nList.get(0).getMid())) {
				logger.info("loginCheck login >>> : 로그인 중 >>> : " + kID);
				return "main/mainPage";
			}else {
				ks.setSession(req, nList.get(0).getMid(), nList.get(0).getMnum() );
				logger.info("loginCheck login >>> : 세션부여 >>> : " + mvo.getMid());
				return "main/mainPage";
			}
		}
		
		logger.info("naverLogin() >>> : 로그인실패");
		return "login/loginForm";
	}
	// 네이버 로그인 ================================================== end
	
	public static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}
			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	public static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다 >>> : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다 >>> : " + apiUrl, e);
		}
	}
	
	public static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);
		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();
			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}
			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다. >>> : ", e);
		}
	}	
}
