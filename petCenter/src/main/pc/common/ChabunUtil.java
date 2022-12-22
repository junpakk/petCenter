package main.pc.common;

public class ChabunUtil {

	public static final String BIZ_GUBUM_BR = "BR"; // 댓글
	public static final String BIZ_GUBUM_BL = "BL"; // 좋아요
	
	
	
	public static String numPad(String t, String c) {
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	public static String getReplyChabun(String type, String memNum) {
		return BIZ_GUBUM_BR.concat(ChabunUtil.numPad(type, memNum));
		
	}
	
	public static String getLikeChabun(String type, String memNum) {
		return BIZ_GUBUM_BL.concat(ChabunUtil.numPad(type, memNum));
		
	}
}
