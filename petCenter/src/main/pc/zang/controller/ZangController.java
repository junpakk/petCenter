package main.pc.zang.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import main.pc.common.ChabunUtil;
import main.pc.common.chabun.service.ChabunUtilService;

import main.pc.zang.service.ZangService;
import main.pc.zang.vo.ZangVO;

@Controller
public class ZangController {
		@Autowired(required=false)
		private ChabunUtilService chabunUtilService;
		@Autowired(required=false)
		private ZangService zangService;
	
	
		//zangInsertForm.pc
		@GetMapping("zangInsertForm")
		public String zangInsertForm() {
			
			return "zang/zangInsertForm";
		}
		
		//zangInsert
		@GetMapping("zangInsert")
		public String petzangInsert(HttpServletRequest req) {
			System.out.println("장인서트진입 >>> : ");
			String bznum = ChabunUtil.getZangChabun("D", chabunUtilService.getZangChabun().getBznum());
			//String bznum = req.getParameter("bznum");
			String bzc = req.getParameter("bzc");
			String mid = req.getParameter("bzmid");
			String bztitle = req.getParameter("bztitle");
			String bzcontent = req.getParameter("bzcontent");
			
			ZangVO zvo = new ZangVO();
			zvo.setBznum(bznum);
			zvo.setBzc(bzc);
			zvo.setMid(mid);
			zvo.setBztitle(bztitle);
			zvo.setBzcontent(bzcontent);
			System.out.println("장인서트진입 >>> : " + zvo.getBznum());
			System.out.println("장인서트진입 >>> : " + zvo.getBzc());
			System.out.println("장인서트진입 >>> : " + zvo.getMid());
			System.out.println("장인서트진입 >>> : " + zvo.getBztitle());
			System.out.println("장인서트진입 >>> : " + zvo.getBzcontent());
			
			int insertnCnt = zangService.petzangInsert(zvo);
			if(insertnCnt>0) {
				System.out.println(" >>> : " + insertnCnt);
				return "zang/zangInsert";
				
			}
			
			return "zang/zangInsertForm";
			
			
		}
		//petzangSelectAll
		@GetMapping("petzangSelectAll")
		public String petzangSelectAll(Model m) {
			System.out.println("장셀렉트올컨트롤러 >>> : ");
			
			List<ZangVO> list = zangService.petzangSelectAll();
			int nCnt = list.size();
			
			if(nCnt>0) {
				m.addAttribute("listAll", list);
				return "zang/zangSelectAll";
				
			}
			return "zang/zangInsertForm";
			
			
		}
		//zangDelete
		@GetMapping("zangDelete")
		public String petzangDelete(HttpServletRequest req, Model m) {
			System.out.println("장Delete진입 >>> : ");
			
			String bznum = req.getParameter("bznum");
			String bzc = req.getParameter("bzc");
			String mid = req.getParameter("mid");
			String bztitle = req.getParameter("bztitle");
			String bzcontent = req.getParameter("bzcontent");
			
			ZangVO zvo = new ZangVO();
			zvo.setBznum(bznum);
			zvo.setBzc(bzc);
			zvo.setMid(mid);
			zvo.setBztitle(bztitle);
			zvo.setBzcontent(bzcontent);
			System.out.println("장Delete진입 >>> : " + zvo.getBznum());
			System.out.println("장Delete진입 >>> : " + zvo.getBzc());
			System.out.println("장Delete진입 >>> : " + zvo.getMid());
			System.out.println("장Delete진입 >>> : " + zvo.getBztitle());
			System.out.println("장Delete진입 >>> : " + zvo.getBzcontent());
			
			int nCnt = zangService.petzangDelete(zvo);
			if(nCnt>0) {
				System.out.println(" >>> : " + nCnt);
				m.addAttribute("delCnt", nCnt);
				return "zang/zangDelete";
				
			}
			
			return "zang/zangSelectAll";
			
			
		}
		//zangSelect
		@GetMapping("zangSelect")
		public String petzangSelect(ZangVO zvo, Model m) {
			System.out.println("장셀렉트컨트롤러 >>> : ");
			
			List<ZangVO> list = zangService.petzangSelect(zvo);
			int nCnt = list.size();
			
			if(nCnt>0) {
				m.addAttribute("listAll", list);
				return "zang/zangSelect";
				
			}
			return "zang/zangInsertForm";
			
			
		}
		//zangUpdate자동맵핑
		@GetMapping("zangUpdate")
		public String petzangUpdate(ZangVO zvo, Model m) {
			System.out.println("장Update진입 >>> : ");
			
			
			System.out.println("장Update진입 >>> : " + zvo.getBznum());
			System.out.println("장Update진입 >>> : " + zvo.getBzc());
			System.out.println("장Update진입 >>> : " + zvo.getMid());
			System.out.println("장Update진입 >>> : " + zvo.getBztitle());
			System.out.println("장Update진입 >>> : " + zvo.getBzcontent());
			
			int insertnCnt = zangService.petzangUpdate(zvo);
			if(insertnCnt>0) {
				System.out.println(" >>> : " + insertnCnt);
				m.addAttribute("upCnt", insertnCnt);
				return "zang/zangUpdate";
				
			}
			
			return "zang/zangSelectAll";
			
			
		}
		
}
