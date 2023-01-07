package main.pc.photo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import main.pc.common.ChabunUtil;
import main.pc.common.CommonUtils;
import main.pc.common.FileUploadUtil;
import main.pc.common.chabun.service.ChabunUtilService;
import main.pc.photo.service.PhotoService;
import main.pc.photo.vo.PhotoVO;

@Controller
public class PhotoController {
	Logger logger = LogManager.getLogger(getClass());
	@Autowired(required=false)
	private ChabunUtilService chabunUtilService;
	@Autowired(required=false)
	private PhotoService photoService;
	
	// 인서트 이동
	@GetMapping("photoInsForm")
	public String comInsForm() {

		return "photo/photoInsForm";
	}
	
	// 인서트 
	@RequestMapping(value="photoIns", method=RequestMethod.POST)
	public String comIns(HttpServletRequest req, Model model) {

		String bpnum = ChabunUtil.getPhotoChabun("D", chabunUtilService.getPhotoChabun().getBpnum());
		
		//이미지 업로드, 이미지 사이즈 새로 만들어서 수정해야할수도 있음
		FileUploadUtil fu = new FileUploadUtil(  CommonUtils.PHOTO_IMG_UPLOAD_PATH
												,CommonUtils.PHOTO_IMG_FILE_SIZE
												,CommonUtils.PHOTO_EN_CODE);
				
		//이미지 파일 원본 사이즈
		boolean bool = fu.imgfileUpload(req);
		logger.info("PHOTO bool: "+ bool);

		PhotoVO pvo = null;
		pvo = new PhotoVO();
		
		pvo.setBpnum(bpnum);
		pvo.setMnum(fu.getParameter("mnum"));
		pvo.setMid(fu.getParameter("mid"));
		pvo.setBptitle(fu.getParameter("bptitle"));
		pvo.setBpphoto(fu.getFileName("bpphoto"));
		
		logger.info(pvo.toString());
		
		int insertCnt = photoService.photoIns(pvo);
		if(insertCnt > 0) {
			logger.info("nCnt >>> "+insertCnt);
			return "photo/photoIns";
		}
		
		return "photo/photoInsForm";
		
	}
	
	
	// 사진게시판 전체조회
	@GetMapping("photoSelAll")
	public String comSelAll(PhotoVO pvo, Model m) {
		logger.info("comSelAll 함수 진입 >>> ");
		
		int pageSize = CommonUtils.COM_PAGE_SIZE;
		int groupSize = CommonUtils.COM_GROUP_SIZE;
		int curPage = CommonUtils.COM_CUR_PAGE;
		int totalCount = CommonUtils.COM_TOTAL_COUNT;
		
		if(pvo.getCurPage() != null) {
			curPage = Integer.parseInt(pvo.getCurPage());
		}
		
		pvo.setPageSize(String.valueOf(pageSize));
		pvo.setGroupSize(String.valueOf(groupSize));
		pvo.setCurPage(String.valueOf(curPage));
		pvo.setTotalCount(String.valueOf(totalCount));
		
		logger.info(pvo.toString());
		
		List<PhotoVO> photoList = photoService.photoSelAll(pvo);
		
		int nCnt = photoList.size();
		
		if(nCnt > 0) {
			logger.info("nCnt >>> "+nCnt);
			
			m.addAttribute("paging", pvo);
			m.addAttribute("photoList", photoList);
			return "photo/photoSelAll";
			
		}
		
		return "photo/photoInsForm";
	}
	
	
	
	
	//게시판 보기
			@GetMapping("photoSelForm")
			public String photoSelForm(PhotoVO pvo, Model m) {
				
				List<PhotoVO> list = photoService.photoSelForm(pvo);
				int nCnt = list.size();

				if(nCnt>0) {
					
					int bhitCnt = photoService.bphitcnt(pvo);
					logger.info("pvo.getbphit "+pvo.getBphit());
					m.addAttribute("listS", list);

					return "photo/photoSelForm";
					
				}
				return "photo/photoSelAll";
				
			}
			

}
