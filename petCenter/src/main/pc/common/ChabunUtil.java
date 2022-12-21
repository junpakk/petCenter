package main.pc.common;

public abstract class ChabunUtil {

	public static final String BIZ_GUBUN_M = "M";	// 멤버
	
	//s
	public static String numPad(String t, String c) {
		for(int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}
		String ymd = DateFormatUtil.ymdFormats(t);
		return ymd.concat(c);
	}
	
	// 멤버
	public static String getMemberChabun(String type, String memNum) {
		return BIZ_GUBUN_M.concat(ChabunUtil.numPad(type, memNum));
	}
	
}
