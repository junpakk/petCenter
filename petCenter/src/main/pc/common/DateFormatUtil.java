package main.pc.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public abstract class DateFormatUtil {

	public static String ymdFormats() {

		return new SimpleDateFormat("yyMMdd").format(new Date());
	}
	
	public static String ymdFormats(String ymdFlag) {
			
			String y = "";
			if ("D".equals(ymdFlag.toUpperCase())) {
				y = DateFormatUtil.ymdFormats();
			}
			return y;
		}
	}
