package main.pc.common;

public abstract class CommonUtils {

	
	
	// 멤버 페이징 상수
	public static final int MEM_PAGE_SIZE = 3;		//페이지사이즈	1페이지당 표시글갯수
	public static final int MEM_GROUP_SIZE = 2;		//그룹사이즈	1페이지당 그룹 갯수
	public static final int MEM_CUR_PAGE = 1;		//현재페이지	초기설정 현재페이지
	public static final int MEM_TOTAL_COUNT = 0;	//토탈카운트	모든 글의 갯수

	// 맵 페이징 상수
	public static final int MAP_PAGE_SIZE = 50;		//페이지사이즈	1페이지당 표시글갯수
	public static final int MAP_GROUP_SIZE = 3;		//그룹사이즈	1페이지당 그룹 갯수
	public static final int MAP_CUR_PAGE = 1;		//현재페이지	초기설정 현재페이지
	public static final int MAP_TOTAL_COUNT = 0;	//토탈카운트	모든 글의 갯수
	
	
	//저장할위치 경로, 상품
	public static final String PRODUCT_IMG_UPLOAD_PATH = "C:\\00.KOSMO120\\30.web\\el_pc_work\\.metadata\\.plugins"
														+ "\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\petCenter\\fileupload\\product";
	public static final int PRODUCT_IMG_FILE_SIZE = 10*1024*1024; //2이미지파일사이즈, 10MB
	public static final String PRODUCT_EN_CODE = "UTF-8";//3인코딩
}
