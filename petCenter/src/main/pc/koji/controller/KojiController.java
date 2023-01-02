package main.pc.koji.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import main.pc.koji.service.KojiService;
import main.pc.koji.vo.KojiVO;

@Controller
public class KojiController {
	
	@Autowired(required=false)
	private KojiService kojiService;
	@GetMapping("kojiForm")
	public String kojiForm() {
		
		return "koji/kojiForm";
	}
	
	//petkojiInsert
	@GetMapping("petkojiInsert")
	public String petkojiInsert(HttpServletRequest req) {
		
		String mid = req.getParameter("mid");
		String ktitle = req.getParameter("ktitle");
		String kcontent = req.getParameter("kcontent");
		
		KojiVO kvo = new KojiVO();
		kvo.setMid(mid);
		kvo.setKtitle(ktitle);
		kvo.setKcontent(kcontent);
		
		int insertnCnt = kojiService.petkojiInsert(kvo);
		if(insertnCnt>0) {
			System.out.println(" >>> : " + insertnCnt);
			return "koji/kojiInsert";
			
		}
		return "koji/kojiForm";
		
		
	}
	
	//parameterType="kojivo"
	//kojiSelectAll
	@GetMapping("kojiSelectAll")
	public String kojiSelectAll(Model m) {
		
		List<KojiVO> list = kojiService.kojiSelectAll();
		int nCnt = list.size();
		if(nCnt>0) {
			m.addAttribute("listAll", list);
			return "koji/kojiSelectAll";
			
		}
		return "koji/kojiForm";
		
		
		
	}
	
	//kojiDelete
	@GetMapping("kojiDelete")
	public String kojiDelete(HttpServletRequest req, Model m) {
		
		String mid = req.getParameter("mid");
		String ktitle = req.getParameter("ktitle");
		String kcontent = req.getParameter("kcontent");
		KojiVO kvo = new KojiVO();
		kvo.setMid(mid);
		kvo.setKtitle(ktitle);
		kvo.setKcontent(kcontent);
		
		int delnCnt = kojiService.kojiDelete(kvo);
		if(delnCnt>0) {
			m.addAttribute("delnCnt", delnCnt);
			return "koji/kojiDelete";
			
		}
		
		return "koji/kojiSelectAll";
		
		
	}
	//kojiSelect
	@GetMapping("kojiSelect")
	public String kojiSelect(KojiVO kvo, Model m) {
		
		System.out.println("설렉트 >>> : ");
		System.out.println("설렉트 >>> : " + kvo.getMid());
		System.out.println("설렉트 >>> : " + kvo.getKtitle());
		System.out.println("설렉트 >>> : " + kvo.getKcontent());
		
		List<KojiVO> list = kojiService.kojiSelect(kvo);
		int nCnt = list.size();
		
		if(nCnt>0) {
			m.addAttribute("listAll", list);
			return "koji/kojiSelect";
			
		}
		return "koji/kojiSelectAll";
		
		
	}
	//kojiUpdate
	@GetMapping("kojiUpdate")
	public String kojiUpdate(KojiVO kvo, Model m) {
		System.out.println("Update >>> : ");
		System.out.println("Update >>> : " + kvo.getMid());
		System.out.println("Update >>> : " + kvo.getKtitle());
		System.out.println("Update >>> : " + kvo.getKcontent());
		
		int insertnCnt = kojiService.kojiUpdate(kvo);
		if(insertnCnt>0) {
			
			return "koji/kojiUpdate";
			
		}
		
		
		return "koji/kojiSelectAll";
		
		
	}

}
