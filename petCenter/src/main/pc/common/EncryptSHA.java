package main.pc.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public abstract class EncryptSHA {
	static Logger logger = LogManager.getLogger(EncryptSHA.class);
	
	/*
	 * 	암호화 할 때 복호화가 불가능한 단방향 방식 암호화
	 * 	SHA-2 Secure Hash Algorithm 2
	 * 	해시 함수가 출력하는 압축된 문장을 다이제스트 Digest 라고 한다.
	 *	SHA-2가 생성하는 다이제스트는 224, 256, 384, 512bit 등 다양
	 *	256bit : SHA-2 를 SHA-256 이라고 한다.
	 */
	
	public static String encryptSHA256(String s) {
		logger.info("encryptSHA256() 함수 진입 >>> : ");
		
		StringBuffer sb = null;
		
		try {
			
//			public static MessageDigest getInstance(String algorithm)
//											throws NoSuchAlgorithmException
//			지정된 다이제스트 알고리즘을 구현하는 MessageDigest 개체를 반환합니다.
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			
			// public void update(byte[] input)
			// 지정된 바이트 배열을 사용하여 요약을 업데이트합니다.
			
			// public byte[] getBytes()
			// 플랫폼의 기본 문자 집합을 사용하여 이 문자열을 바이트 시퀀스로 인코딩하고 
			// 결과를 새 바이트 배열에 저장합니다.
			
			// public byte[] digest()
			// 패딩과 같은 최종 작업을 수행하여 해시 계산을 완료합니다.
			// 이 호출이 실행된 후 요약이 재설정됩니다.
			
			md.update(s.getBytes());
			byte byteData[] = md.digest();
			
			logger.info("md >>> : " + md);
			logger.info("byteData >>> : " + byteData);
			
			sb = new StringBuffer();
			for (int i=0; i < byteData.length; i++) {
				
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
				
				/*
				int tmp = byteData[i] & 0xff;
				logger.info("tmp >>> : " + tmp);
				int tmp_1 = 0x100;
				logger.info("tmp_1 >>> : " + tmp_1);
				int tmp_sum = tmp + tmp_1;
				logger.info("tmp_sum >>> : " + tmp_sum);
				String tmp_s = Integer.toString(tmp_sum, 16);
				logger.info("tmp_s >>> : " + tmp_s);
				String tmp_s_1 = tmp_s.substring(1);
				logger.info("tmp_s_1 >>> : " + tmp_s_1);	
				*/
				
			}
			
		} catch(NoSuchAlgorithmException e) {
			logger.info("에러가 >>> : " + e.getMessage());
		}
		
		return sb.toString();
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String s = EncryptSHA.encryptSHA256("qwer1234!@#$");
		logger.info("SHA-256 >>> : " + s);
		String ss = "adb2b265835955b6637e50945d7a92ab7bd9160fa2e3705d0384b5eb9d177d40";
		logger.info("ss.length() >>> : " + ss.length());
		
		boolean b = s.equals(ss);
		if (b) {
			logger.info("boolean b = s.equals(ss) >>> : " + b);
		}
		
		
	}

}
