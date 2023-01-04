package main.pc.community.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import main.pc.community.vo.CommunityVO;
import main.pc.common.ChabunUtil;
import main.pc.common.CommonUtils;
import main.pc.common.chabun.service.ChabunUtilService;

import main.pc.community.service.CommunityService;

import java.util.List;

@Controller
public class CommunityController {
	Logger logger = LogManager.getLogger(getClass());
	
	@Autowired(required=false)
	private ChabunUtilService chabunUtilService;	
	@Autowired(required=false)
	private CommunityService communityService;

	@GetMapping("communityInsertForm")
	public String communityInsertForm() {
		logger.info("communityInsertForm() 진입");
		return "community/communityInsertForm";
	}
	
	@GetMapping("communityInsert")
	public String petcommunityInsert(HttpServletRequest req, CommunityVO cvo) {
		logger.info("커뮤니티인서트진입 >>> : ");
		
		String bcnum = ChabunUtil.getCommunityChabun("D", chabunUtilService.getCommunityChabun().getBcnum());
		logger.info("채번ed bcnum >>> : " + bcnum);
		cvo.setBcnum(bcnum);
		logger.info(cvo.toString());

		int insertnCnt = communityService.petcommunityInsert(cvo);
		
		if(insertnCnt > 0) {
			logger.info(">>> : " + insertnCnt);
			return "community/communityInsert";
		}
		logger.info("커뮤니티 글쓰기 실패하였습니다");
		return "community/communityInsertForm";
	}
	
	@GetMapping("communitySelectAll")
	public String petcommunitySelectAll(CommunityVO cvo, Model m) {
		
		logger.info("petcommunitySelectAll 함수 진입");
		
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
		
		List<CommunityVO> list = communityService.petcommunitySelectAll();
		int nCnt = list.size();
		
		if(nCnt>0) {
			logger.info("커뮤니티조회 성공  >>> "+nCnt);
			
			m.addAttribute("paging", cvo);
			m.addAttribute("listAll", list);
			return "community/communitySelectAll";
			
		}
		return "community/communityInsertForm";
		
	}
	
	//communityDelete
		@GetMapping("communityDelete")
		public String petcommunityDelete(HttpServletRequest req, Model m) {
			System.out.println("커뮤니티Delete진입 >>> : ");
			
			String bcnum = req.getParameter("bcnum");
			String bcc = req.getParameter("bcc");
			String mid = req.getParameter("mid");
			String bctitle = req.getParameter("bctitle");
			String bccontent = req.getParameter("bccontent");
			System.out.println("커뮤니티Delete >>> : " + bcnum);
			System.out.println("커뮤니티Delete >>> : " + bcc);
			System.out.println("커뮤니티Delete >>> : " + mid);
			System.out.println("커뮤니티Delete >>> : " + bctitle);
			System.out.println("커뮤니티Delete >>> : " + bccontent);
			
			CommunityVO covo = new CommunityVO();
			covo.setBcnum(bcnum);
			covo.setBcc(bcc);
			covo.setMid(mid);
			covo.setBctitle(bctitle);
			covo.setBccontent(bccontent);
			System.out.println("Delete>>> : " + covo.getBcnum());
			System.out.println("Delete>>> : " + covo.getBcc());
			System.out.println("Delete>>> : " + covo.getMid());
			System.out.println("Delete>>> : " + covo.getBctitle());
			System.out.println("Delete>>> : " + covo.getBccontent());
			
			int nCnt = communityService.petcommunityDelete(covo);
			
			if(nCnt>0) {
				m.addAttribute("delCnt", nCnt);
				return "community/communityDelete";
				
			}
			return "community/communitySelectAll";
			
			
		}
		
		//communitySelect
		@GetMapping("communitySelect")
		public String petcommunitySelect( CommunityVO covo, Model m) {
			
			List<CommunityVO> list = communityService.petcommunitySelect(covo);
			int nCnt = list.size();
			
			if(nCnt>0) {
				m.addAttribute("listSel", list);
				return "community/communitySelect";
				
			}
			return "community/communitySelectAll";
			
		}
		
		//communityUpdate
		@GetMapping("communityUpdate")
		public String petcommunityUpdate(CommunityVO covo, Model m) {
			System.out.println("커뮤니티Update진입 >>> : ");
			
			System.out.println("커뮤니티Update진입 >>> : " + covo.getBcnum());
			System.out.println("커뮤니티Update진입 >>> : " + covo.getBcc());
			System.out.println("커뮤니티Update진입 >>> : " + covo.getMid());
			System.out.println("커뮤니티Update진입 >>> : " + covo.getBctitle());
			System.out.println("커뮤니티Update진입 >>> : " + covo.getBccontent());
		
			int insertnCnt = communityService.petcommunityUpdate(covo);
			if(insertnCnt>0) {
				System.out.println("커뮤니티Update >>> : " + insertnCnt);
				m.addAttribute("UpCnt", insertnCnt);
				return "community/communityUpdate";
			}
			
			return "community/communityInsertForm";
			
			
		}
		
		//게시판 보기
		@GetMapping("communitySelectForm")
		public String petcommunitySelectForm(CommunityVO covo, Model m) {
			
			List<CommunityVO> list = communityService.petcommunitySelect(covo);
			int nCnt = list.size();

			if(nCnt>0) {
				m.addAttribute("listS", list);

				return "community/communitySelectForm";
				
			}
			return "community/communitySelectAll";
			
		}
		
}
