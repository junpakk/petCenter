package main.pc.common;

import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

//얘의 기능은 그대로 가져오고, binary파일업로드(POST)를 가능하게 하기 위해서 FileUploadUtil를 만들었다.
import com.oreilly.servlet.MultipartRequest;

//여기 파트 학습해야함
public class FileUploadUtil {
	
	Logger logger = LogManager.getLogger(this.getClass());
	
	private String imgfilePaths;
	private int imgfileSize;
	private String encodeType;
	private MultipartRequest mr;//com.oreilly.servlet.MultipartRequest;
	
	public FileUploadUtil(String imgfilePaths, int imgfileSize, String encodeType) {
		logger.info("FileUploadUtil() 진입: ");
		
		this.imgfilePaths = imgfilePaths;
		this.imgfileSize = imgfileSize;
		this.encodeType = encodeType;
	}
	
	//imgfileUpload(HttpServletRequest req)
	public boolean imgfileUpload(HttpServletRequest req) {
		logger.info("imgfileUpload() 진입: ");
		boolean bool = imgfileUpload(req, imgfilePaths);
		
		return bool;
	}
	
	//imgfileUpload(HttpServletRequest req, String filePath)
	public boolean imgfileUpload(HttpServletRequest req, String filePath) {
		boolean bool = false;
		
		try {
			logger.info("imgfileUpload() 진입: ");
			//logger.info("imgfileUpload mname >>> : " + req.getParameter("mname"));//데이터 경로 test -> null
			//logger.info("imgfileUpload mphoto >>> : " + mr.getParameter("mphoto"));//데이터 경로 test -> null, 이 로그때문에 오류발생
			//MultipartRequest(req, filePath, imgfileSize, encodeType, new FileRename()) 인스턴스 끝나면 데이터저장 끝
			mr = new MultipartRequest(req, filePath, imgfileSize, encodeType, new FileRename());
			logger.info("imgfileUpload mname mr >>> : " + mr.getParameter("mname"));//데이터 경로 test -> 테스트2
			logger.info("imgfileUpload mphoto mr >>> : " + mr.getFilesystemName("mphoto"));//데이터 경로 test -> 04 (2).png
			
			logger.info("mr: "+ mr);
			bool = true;
			
		}catch(Exception e){
			logger.info("imgfileUpload(): "+ mr);
		}
		return bool;
	}
	//com.oreilly.servlet.MultipartRequest;
	public String getParameter(String s) {
		return mr.getParameter(s);
	}
	//com.oreilly.servlet.MultipartRequest;
	public String[] getParameterValues(String s) {
		return mr.getParameterValues(s);
	}
	//com.oreilly.servlet.MultipartRequest;
	public String getFileName(String f) {
		return mr.getFilesystemName(f);
	}
	
	public ArrayList<String> getFileNames(){
		logger.info("getFileNames() 진입: ");
		
		@SuppressWarnings("unchecked")
		Enumeration<String> en = mr.getFileNames();
		ArrayList<String> a = new ArrayList<String>();
		
		while(en.hasMoreElements()) {
			String f = en.nextElement().toString();
			a.add(mr.getFilesystemName(f));
		}
		return a;
	}

}
