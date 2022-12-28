package main.pc.common;

public abstract class ChabunUtil {

	public static final String BIZ_GUBUN_M = "M";	// 멤버
	public static final String BIZ_GUBUN_P = "P";	// 상품
	public static final String BIZ_GUBUN_BR = "BR"; // 댓글
	public static final String BIZ_GUBUN_BL = "BL"; // 좋아요
	public static final String BIZ_GUBUN_BF = "BF"; // 박람회
	public static final String BIZ_GUBUM_MP = "MP"; // 좋아요	
	
	
	public static String numPad(String t, String c) {
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	// 댓글
	public static String getReplyChabun(String type, String memNum) {
		return BIZ_GUBUN_BR.concat(ChabunUtil.numPad(type, memNum));
		
	}
	// 좋아요
	public static String getLikeChabun(String type, String memNum) {
		return BIZ_GUBUN_BL.concat(ChabunUtil.numPad(type, memNum));
		
	}
	// 멤버
	public static String getMemberChabun(String type, String memNum) {
		return BIZ_GUBUN_M.concat(ChabunUtil.numPad(type, memNum));
	}
	// 상품
	public static String getProductChabun(String type, String productNum) {
		return BIZ_GUBUN_P.concat(ChabunUtil.numPad(type, productNum));
	}

	// 박람회
	public static String getFairChabun(String type, String productNum) {
		return BIZ_GUBUN_BF.concat(ChabunUtil.numPad(type, productNum));
	}
	// 맵
	public static String getMapChabun(String type, String productNum) {
		return BIZ_GUBUM_MP.concat(ChabunUtil.numPad(type, productNum));
	}

}
