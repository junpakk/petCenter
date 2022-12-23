package main.pc.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public abstract class DateFormatUtil {
	
	public static String ymdFormat() {
		return new SimpleDateFormat("yyMMdd").format(new Date());
	}
	
	public static String ymdFormats(String ymdFlag) {
		
		//ymdFlag 입력값에 따라 문자열 y 값이 바뀐다
		String y = "";
		if ("D".equals(ymdFlag.toUpperCase())) {
			y = DateFormatUtil.ymdFormat();
		}
		
		return y;
	}
	
}

