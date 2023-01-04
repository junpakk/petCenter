package main.pc.communities.controller;

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
import main.pc.communities.service.CommunitiesService;
import main.pc.communities.vo.CommunitiesVO;

@Controller
public class CommunitiesController {
	Logger logger = LogManager.getLogger(getClass());
	@Autowired(required=false)
	private ChabunUtilService chabunUtilService;
	@Autowired(required=false)
	private CommunitiesService communitiesService;
	
	@GetMapping("comInsForm")
	public String comInsForm() {
		logger.info("comInsForm() 진입");
		return "com/comInsForm";
	}
	
	@RequestMapping(value="comIns", method=RequestMethod.POST)
	public String comIns(HttpServletRequest req, Model model) {
		logger.info("comIns 함수 진입 >>> ");

		String bcnum = ChabunUtil.getCommunitiesChabun("D", chabunUtilService.getCommunitiesChabun().getBcnum());
		logger.info("bcnum >>> "+bcnum);
		
		FileUploadUtil fu = new FileUploadUtil(	CommonUtils.COM_IMG_UPLOAD_PATH
												,CommonUtils.COM_IMG_FILE_SIZE
												,CommonUtils.COM_EN_CODE);
		
		boolean bool = fu.imgfileUpload(req);
		logger.info("bool >>> "+bool);

		CommunitiesVO cvo = null;
		cvo = new CommunitiesVO();
		
		cvo.setBcnum(bcnum);
		cvo.setBcc(fu.getParameter("bcc"));
		cvo.setMnum(fu.getParameter("mnum"));
		cvo.setMid(fu.getParameter("mid"));
		cvo.setBctitle(fu.getParameter("bctitle"));
		cvo.setBccontent(fu.getParameter("bccontent"));
		cvo.setBcphoto(fu.getFileName("bcphoto"));
		
		logger.info(cvo.toString());
		
		int insertCnt = communitiesService.comIns(cvo);
		if(insertCnt > 0) {
			logger.info("nCnt >>> "+insertCnt);
			return "com/comIns";
		}
		
		return "com/comInsForm";
		
	}	
}
