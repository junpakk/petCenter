package main.pc.common;

public abstract class CommonUtils {
	
	// 멤버 페이징 상수
	public static final int MEM_PAGE_SIZE = 10;		//페이지사이즈	1페이지당 표시글갯수
	public static final int MEM_GROUP_SIZE = 4;		//그룹사이즈	1페이지당 그룹 갯수
	public static final int MEM_CUR_PAGE = 1;		//현재페이지	초기설정 현재페이지
	public static final int MEM_TOTAL_COUNT = 0;	//토탈카운트	모든 글의 갯수

	// 맵 페이징 상수
	public static final int MAP_PAGE_SIZE = 50;		//페이지사이즈	1페이지당 표시글갯수
	public static final int MAP_GROUP_SIZE = 3;		//그룹사이즈	1페이지당 그룹 갯수
	public static final int MAP_CUR_PAGE = 1;		//현재페이지	초기설정 현재페이지
	public static final int MAP_TOTAL_COUNT = 0;	//토탈카운트	모든 글의 갯수
	
	// 커뮤니티 페이징 상수
	public static final int COM_PAGE_SIZE = 5;		//페이지사이즈	1페이지당 표시글갯수
	public static final int COM_GROUP_SIZE = 3;		//그룹사이즈	1페이지당 그룹 갯수
	public static final int COM_CUR_PAGE = 1;		//현재페이지	초기설정 현재페이지
	public static final int COM_TOTAL_COUNT = 0;	//토탈카운트	모든 글의 갯수
	
	// 이미지 저장 공통폴더 경로
	public static final String PETCENTER_IMG_UPLOAD_PATH = "C:\\00.KOSMO120\\30.web\\el_pc_work\\.metadata\\.plugins"
														+ "\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\petCenter\\fileupload\\";
	
	//저장할위치 경로, 상품
	public static final String PRODUCT_IMG_UPLOAD_PATH = PETCENTER_IMG_UPLOAD_PATH + "product";
	public static final int PRODUCT_IMG_FILE_SIZE = 10*1024*1024; //2이미지파일사이즈, 10MB
	public static final String PRODUCT_EN_CODE = "UTF-8";//3인코딩
	
	// 박람회
	public static final String FAIR_IMG_UPLOAD_PATH = PETCENTER_IMG_UPLOAD_PATH + "fair";
	public static final int FAIR_IMG_FILE_SIZE = 10*1024*1024; //2이미지파일사이즈, 10MB
	public static final String FAIR_EN_CODE = "UTF-8";//3인코딩
	
	//커뮤니티
	public static final String COM_IMG_UPLOAD_PATH = PETCENTER_IMG_UPLOAD_PATH + "com";
	public static final int COM_IMG_FILE_SIZE = 10*1024*1024;
	public static final String COM_EN_CODE = "UTF-8";
	
	//공지사항
	public static final String NOTICE_IMG_UPLOAD_PATH = PETCENTER_IMG_UPLOAD_PATH + "notice";
	public static final int NOTICE_IMG_FILE_SIZE = 10*1024*1024; //2이미지파일사이즈, 10MB
	public static final String NOTICE_EN_CODE = "UTF-8";//3인코딩
}
