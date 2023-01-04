package main.pc.communities.controller;

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
import main.pc.communities.service.CommunitiesService;
import main.pc.communities.vo.CommunitiesVO;

@Controller
public class CommunitiesController {
	Logger logger = LogManager.getLogger(getClass());
	@Autowired(required=false)
	private ChabunUtilService chabunUtilService;
	@Autowired(required=false)
	private CommunitiesService communitiesService;
	
	// 인서트 이동
	@GetMapping("comInsForm")
	public String comInsForm() {
		logger.info("comInsForm() 진입");
		return "com/comInsForm";
	}
	
	// 인서트 
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
	
	
	// 커뮤니티 전체조회
	@GetMapping("comSelAll")
	public String comSelAll(CommunitiesVO cvo, Model m) {
		logger.info("comSelAll 함수 진입 >>> ");
		
		int pageSize = CommonUtils.COM_PAGE_SIZE;
		int groupSize = CommonUtils.COM_GROUP_SIZE;
		int curPage = CommonUtils.COM_CUR_PAGE;
		int totalCount = CommonUtils.COM_TOTAL_COUNT;
		
		if(cvo.getCurPage() != null) {
			curPage = Integer.parseInt(cvo.getCurPage());
		}
		
		cvo.setPageSize(String.valueOf(pageSize));
		cvo.setGroupSize(String.valueOf(groupSize));
		cvo.setCurPage(String.valueOf(curPage));
		cvo.setTotalCount(String.valueOf(totalCount));
		
		logger.info(cvo.toString());
		
		List<CommunitiesVO> comList = communitiesService.comSelAll(cvo);
		
		int nCnt = comList.size();
		
		if(nCnt > 0) {
			logger.info("nCnt >>> "+nCnt);
			
			m.addAttribute("paging", cvo);
			m.addAttribute("comList", comList);
			return "com/comSelAll";
			
		}
		
		return "com/comInsForm";
	}
	
	
	// 팁 게시판 전체 조회
	@GetMapping("tipSelAll")
	public String tipSelAll(CommunitiesVO cvo, Model m) {
		logger.info("comSelAll 함수 진입 >>> ");
		
		int pageSize = CommonUtils.COM_PAGE_SIZE;
		int groupSize = CommonUtils.COM_GROUP_SIZE;
		int curPage = CommonUtils.COM_CUR_PAGE;
		int totalCount = CommonUtils.COM_TOTAL_COUNT;
		
		if(cvo.getCurPage() != null) {
			curPage = Integer.parseInt(cvo.getCurPage());
		}
		
		cvo.setPageSize(String.valueOf(pageSize));
		cvo.setGroupSize(String.valueOf(groupSize));
		cvo.setCurPage(String.valueOf(curPage));
		cvo.setTotalCount(String.valueOf(totalCount));
		
		logger.info(cvo.toString());
		
		List<CommunitiesVO> comList = communitiesService.tipSelAll(cvo);
		
		int nCnt = comList.size();
		
		if(nCnt > 0) {
			logger.info("nCnt >>> "+nCnt);
			
			m.addAttribute("paging", cvo);
			m.addAttribute("comList", comList);
			return "tip/tipSelAll";
			
		}
		
		return "tip/tipSelAll";
	}
	
	//게시판 보기
			@GetMapping("comSelForm")
			public String comSelForm(CommunitiesVO cvo, Model m) {
				
				List<CommunitiesVO> list = communitiesService.comSelForm(cvo);
				int nCnt = list.size();

				if(nCnt>0) {
					
					int bhitCnt = communitiesService.bchitcnt(cvo);
					logger.info("cvo.getbchit "+cvo.getBchit());
					m.addAttribute("listS", list);

					return "com/comSelForm";
					
				}
				return "com/comSelAll";
				
			}

}
