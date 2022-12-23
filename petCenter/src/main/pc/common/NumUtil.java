package main.pc.common;

import java.text.DecimalFormat;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class NumUtil {
	static Logger logger = LogManager.getLogger(NumUtil.class);
	
	//포맷 변경, String -> Int
	public static String comma(String s) {
		int iS = Integer.parseInt(s);
		return new DecimalFormat("###,###").format(iS);
	}
	
	//포맷 변경, ',' 있으면 없애고 없으면  그대로 반환
	public static String comma_replace(String s) {
		
		String ss = "";
		int is = s.indexOf(',');
		
		//',' 있으면 없애고 없으면  그대로 반환
		if(is != -1) {
			logger.info("is: "+ is);
			ss = s.replace(",", "");
		}else {
			ss = s;
		}
		return ss;
	}
	
	public static void main(String args[]) {		
		//System.out.println(NumUtil.comma("5000"));
		System.out.println(NumUtil.comma_replace("50000"));
		System.out.println(NumUtil.comma_replace("50,000"));
	}

}
