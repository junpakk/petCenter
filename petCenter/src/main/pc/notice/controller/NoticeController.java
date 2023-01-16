package main.pc.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import main.pc.common.ChabunUtil;
import main.pc.common.CommonUtils;
import main.pc.common.FileUploadUtil;
import main.pc.common.chabun.service.ChabunUtilService;
import main.pc.notice.service.NoticeService;
import main.pc.notice.vo.NoticeVO;

@Controller
public class NoticeController {
	
	@Autowired(required=false)
	private NoticeService noticeService;
	
	@Autowired(required=false)
	private ChabunUtilService chabunUtilService;
			//noticeInsertForm.pc
	
	@GetMapping("noticeInsertForm")
	public String noticeInsertForm() {
		
		return "notice/noticeInsertForm";
	}
	
	//noticeInsert
	@PostMapping("noticeInsert")
	public String noticeInsert(HttpServletRequest req) {
		
		String bnnum = ChabunUtil.getNoticeChabun("D", chabunUtilService.getNoticeChabun().getBnnum());
		
		FileUploadUtil fu = new FileUploadUtil(
											CommonUtils.NOTICE_IMG_UPLOAD_PATH
											,CommonUtils.NOTICE_IMG_FILE_SIZE
											,CommonUtils.NOTICE_EN_CODE
		);
		
		boolean bool = fu.imgfileUpload(req);
		
		NoticeVO nvo = new NoticeVO();
		nvo.setBnnum(bnnum);
		nvo.setBntitle(fu.getParameter("bntitle"));
		nvo.setBncontent(fu.getParameter("bncontent"));
		nvo.setBnphoto(fu.getFileName("bnphoto"));
		
		int insertnCnt = noticeService.noticeInsert(nvo);
		if(insertnCnt>0) {
			return "main/mainPage";
			
		}
		return "main/mainPage";
	}
	
	//listAll
	@GetMapping("noticeSelectAll")
	public String noticeSelectAll(NoticeVO nvo, Model m) {
		
		List<NoticeVO> list = noticeService.noticeSelectAll(nvo);
		int nCnt = list.size();
		
		if(nCnt>0) {
			m.addAttribute("listAll", list);
			return "notice/noticeSelectAll";
			
		}
		return "notice/noticeInsertForm";
	}
}
