package main.pc.fair.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import main.pc.common.ChabunUtil;
import main.pc.common.CommonUtils;
import main.pc.common.FileUploadUtil;
import main.pc.common.chabun.service.ChabunUtilService;
import main.pc.fair.service.FairService;
import main.pc.fair.vo.FairVO;
import main.pc.product.vo.ProductVO;

@Controller
public class FairController {
	Logger logger = LogManager.getLogger(FairController.class);
	
	@Autowired(required=false)
	private FairService fairService;
	
	@Autowired(required=false)
	private ChabunUtilService chabunUtilService;
	
	
	// 박람회 인서트 폼
	@GetMapping("fairInsertForm")

	public String fairInsertForm() {
		logger.info("fairInsertForm 함수 진입");
			return "fair/fairInsertForm";
		}
	
	// 박람회 등록
		@PostMapping("fairInsert")
		public String fairInsert(HttpServletRequest req) {
			logger.info("fairInsert 함수 진입");
			
			// 채번
			String bfnum = ChabunUtil.getFairChabun("D", chabunUtilService.getFairChabun().getBfnum());
			logger.info("fairInsert bfnum : " + bfnum);
			
			
			
			//이미지 업로드
			FileUploadUtil fu = new FileUploadUtil(  CommonUtils.FAIR_IMG_UPLOAD_PATH
													,CommonUtils.FAIR_IMG_FILE_SIZE
													,CommonUtils.FAIR_EN_CODE);
					
			//이미지 파일 원본 사이즈
			boolean bool = fu.imgfileUpload(req);
			logger.info("fairInsert bool: "+ bool);
			

			FairVO fvo = null;
			fvo = new FairVO();
			
			fvo.setBfnum(bfnum);
			fvo.setBfname(fu.getParameter("bfname"));
			fvo.setBfdate(fu.getParameter("bfdate"));
			fvo.setBfplace(fu.getParameter("bfplace"));
			fvo.setBfphoto(fu.getFileName("bfphoto"));

			int nCnt = fairService.fairInsert(fvo);
			logger.info("fairInsert nCnt: "+ nCnt);
			if(nCnt > 0) {
				return "main/mainPage";
			}
			return "main/mainPage";
		}
	
	
	
	// 박람회 조회
	@GetMapping("fairSelectAll")
	public String fairSelectAll(FairVO fvo, Model model) {
		logger.info("fairSelectAll 함수 진입");
		
		List<FairVO> fairAll = fairService.fairSelectAll(fvo);
		int nCnt = fairAll.size();
		logger.info("fairSelectAll nCnt : " + nCnt);
		
		if (nCnt > 0) {
			model.addAttribute("fairAll", fairAll);
			return "fair/fairSelectAll";
		}
		
		return "fair/fairSelectAll";
		
	}
	
	// 게시글 내용보기  
		@GetMapping("fairSelect")
		public String fairSelect(FairVO fvo, Model model) {
			logger.info("fairSelect 함수 진입");
						
			// 서비스 호출
//			List<FairVO> listS = fairService.fairSelect(fvo);		
//			if (listS.size() == 1) { 
//										
//				model.addAttribute("listS", listS);
				return "fair/fairSelect";
//			}		
			
//			return "fair/fairSelectAll";
		}
	
	// 박람회 삭제
	@GetMapping("fairDelete")
	public String fairDelete(FairVO fvo, Model model) {
		logger.info("fairDelete 함수 진입 ");
		
		int dCnt =fairService.fairDelete(fvo);
		if (dCnt > 0) {
			logger.info("fairDelete dCnt : " + dCnt);
			
			model.addAttribute("dCnt", dCnt);
			return "fair/fairSelectAll";
		}
		return "fair/fairSelectAll";
	}
}
