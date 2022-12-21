package main.pc.common;

import java.io.File;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileRename implements FileRenamePolicy {
	
	Logger logger = LogManager.getLogger(this.getClass());

	public FileRename() {
		
	}
	
	@Override
	public File rename(File sf) {
		// TODO Auto-generated method stub
		//getName() : 파일 또는 디렉토리의 이름을 반환
		String f = sf.getName();
		logger.info("rename() 진입: ");
		
		try {
			String s = f;
			logger.info("s: "+ s);
			for(int i=1; sf.exists(); i++) {
				int lt = s.lastIndexOf(".");
				logger.info("lt: "+ lt);
				String s1 = s.substring(0, lt);
				String s2 = s.substring(lt);
				String st = "_" + i + "_";
				
				f = s1.concat(st).concat(s2);
				sf = new File(sf.getParent(), f);
			}
		}catch(Exception e) {
			logger.info("rename() 에러발생: "+ e.getMessage());
		}
		return sf;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		File f = new File("c:\\msdia80.dll");
		File ss = new FileRename().rename(f);
		System.out.println("ss: "+ ss.getName());
	}
}
