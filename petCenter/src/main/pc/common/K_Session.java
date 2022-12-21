package main.pc.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import main.pc.member.vo.MemberVO;

public class K_Session {
	
	private static final String K_SESSION_ID = "KID";
	
//	private static K_Session kSession = null;
//	public static K_Session getInstance() {
//		if(kSession == null) {
//			kSession = new K_Session();
//		}
//		return kSession;
//	}
	
	// 싱글톤 패턴 : Singleton pattern
	private static class LazyHolder{
		public static final K_Session SESSIONLISTENER_INSTANCE = new K_Session();
	}
	
	public static K_Session getInstance() {
		return LazyHolder.SESSIONLISTENER_INSTANCE;
	}
	
	public K_Session() {
		super();
	}
	
	
	public void killSession(final HttpServletRequest hReq) {
		
		HttpSession hSession = hReq.getSession(false);
		if (hSession != null) {
			hSession.removeAttribute(K_SESSION_ID);
			// 이 세션을 무효화한 다음 세션에 바인딩된 개체의 바인딩을 해제합니다.
			hSession.invalidate();
		}
	}
	
	
	//public boolean setSession(final HttpServletRequest hReq, final String userID) {
	public boolean setSession(final HttpServletRequest hReq, final MemberVO mvo) {
		
		HttpSession hSession = hReq.getSession();
		String k_session_val = ((MemberVO)hSession.getAttribute(K_SESSION_ID)).getMid();
		int nCnt = 0;
		
		if(k_session_val != null) {
			boolean b1 = k_session_val.equals(mvo.getMid());
			
			if (b1) {
				nCnt++;
			}else {
				System.out.println("세션 없음 >>> : ");
			}
			
		}else {
			System.out.println("세션 없음 >>> : ");
		}
		
		if (nCnt == 0) {
//			hSession.invalidate();
			
			// void setAttribute(String name, Object value)
			// 지정한 이름을 사용하여 이 세션에 개체를 바인딩합니다.
			hSession.setAttribute(K_SESSION_ID, mvo);
			
			// void setMaxInactiveInterval(int interval)
			// 서블릿 컨테이너가 이 세션을 무효화할 때까지 
			// 클라이언트 요청 사이의 시간(초)을 지정합니다.
			hSession.setMaxInactiveInterval(60*60*9); // 9시간
			
			return false;
		}
		
		return true;
	}
	
	public String getSession(final HttpServletRequest hReq) {
		
		String strSession = "";
		
		// HttpSession getSession(boolean create)
		// 이 요청과 연결된 현재 HttpSession을 반환하거나, 
		// 현재 세션이 없을때 true 면 새 세션을 만들어서 반환합니다.
		// 현재 세션이 없으면 false 면 null을 반환합니다.
		// ======================================================
		// 연결된 세션이 있을 때는 현재 세션 반환
		// 연결된 세션이 없을 때는 null 값 반환
		HttpSession hSession = hReq.getSession(false);
		// 낫널일때 == 현재 연결된 세션이 있을때
		if (hSession != null) {
			
			// Object getAttribute(String name)
			// 이 세션에서 지정한 이름으로 바인딩된 개체를 반환하거나, 
			// 이름으로 바인딩된 개체가 없는 경우 null을 반환합니다.
			//strSession = ((MemberVO)hSession.getAttribute(K_SESSION_ID)).getMid();
		}
		
		return strSession;
	}
	
	
	
	
	
}
