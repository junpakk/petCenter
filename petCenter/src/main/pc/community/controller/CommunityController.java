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
	//communityInsertForm.pc
	@GetMapping("communityInsertForm")
	public String communityInsertForm() {
		
	
		
		return "community/communityInsertForm";
	}
	
	//communityInsert
	@GetMapping("communityInsert")
	public String petcommunityInsert(HttpServletRequest req) {
		System.out.println("커뮤니티인서트진입 >>> : ");
		String bcnum = ChabunUtil.getCommunityChabun("D", chabunUtilService.getCommunityChabun().getBcnum());
		System.out.println(" >>> : " + bcnum);
		//String bcnum = kosChabunService.getCartChabun().getBcnum();
		//String bcnum = req.getParameter("bcnum");
		String bcc = req.getParameter("bcc");
		String mid = req.getParameter("mid");
		String bctitle = req.getParameter("bctitle");
		String bccontent = req.getParameter("bccontent");
		System.out.println("커뮤니티인서트 >>> : " + bcnum);
		System.out.println("커뮤니티인서트 >>> : " + bcc);
		System.out.println("커뮤니티인서트 >>> : " + mid);
		System.out.println("커뮤니티인서트 >>> : " + bctitle);
		System.out.println("커뮤니티인서트 >>> : " + bccontent);
		
		CommunityVO covo = new CommunityVO();
		covo.setBcnum(bcnum);
		covo.setBcc(bcc);
		covo.setMid(mid);
		covo.setBctitle(bctitle);
		covo.setBccontent(bccontent);
		System.out.println(">>> : " + covo.getBcnum());
		System.out.println(">>> : " + covo.getBcc());
		System.out.println(">>> : " + covo.getMid());
		System.out.println(">>> : " + covo.getBctitle());
		System.out.println(">>> : " + covo.getBccontent());
		
		int insertnCnt = communityService.petcommunityInsert(covo);
		
		if(insertnCnt>0) {
			System.out.println(">>> : " + insertnCnt);
			return "community/communityInsert";
			
		}
		return "community/communityInsertForm";
		
		
	}
	
	@GetMapping("communitySelectAll")
	public String petcommunitySelectAll(Model m) {
		
		List<CommunityVO> list = communityService.petcommunitySelectAll();
		int nCnt = list.size();
		
		if(nCnt>0) {
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
