package main.pc.reply.controller;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.pc.common.ChabunUtil;
import main.pc.common.chabun.service.ChabunUtilService;
import main.pc.reply.service.ReplyService;
import main.pc.reply.vo.ReplyVO;

@Controller
public class ReplyController {

	Logger logger = LogManager.getLogger(ReplyController.class);
	
	// 채번 서비스 연결
	@Autowired(required=false)
	private ChabunUtilService chabunUtilService;
	
	
	// 댓글 서비스 연결
	@Autowired(required=false)
	private ReplyService replyService; 
	
	@GetMapping("replyForm")
	public String replyForm() {
		logger.info("ReplyForm 함수 진입");
		return "reply/replyForm";		
	}
	
	// 댓글 등록
	@PostMapping("replyInsert")
	@ResponseBody
	public String replyInsert(ReplyVO rvo) {
		logger.info("replyInsert 함수 진입");
		
		// 채번
		String brnum = ChabunUtil.getReplyChabun("D", chabunUtilService.getReplyChabun().getBrnum());
		logger.info("replyInsert brnum : " + brnum);
		
		rvo.setBrnum(brnum);
		
		int nCnt = replyService.replyInsert(rvo);
		logger.info("replyInsert nCnt : " + nCnt);
		
		if(1 == nCnt) {
			return "GOOD";
		}else {
			return "BAD";
		}
	}
	
	// 댓글 전체 조회
	@PostMapping(value="replySelectAll", produces="application/text;charset=utf-8")
	@ResponseBody
	public String replySelectAll(ReplyVO rvo) {
		logger.info("replySelectAll rvo.getBcnum() : " + rvo.getBcnum());
				
		List<ReplyVO> list = replyService.replySelectAll(rvo);
		logger.info("replySelectAll list : " + list);
		
		String ss = "";
		String listStr ="";
		for (int i=0; i < list.size(); i++) {
			ReplyVO _rvo = list.get(i);
			String s0 = _rvo.getBrnum();
			String s1 = _rvo.getMid();
			String s2 = _rvo.getBrcontent();
			String s3 = _rvo.getIdate();
			ss = s0+","+s1+","+s2+","+s3;
			listStr += ss+"&";
			
		}
		return listStr;
	}
	
	// 댓글 삭제
		@PostMapping("replyDelete")
		@ResponseBody
		public String replyDelete(ReplyVO rvo) {
			logger.info("replyDelete rvo.getBrnum() : " + rvo.getBrnum());
			
			int nCnt = replyService.replyDelete(rvo);
			logger.info("replyDelete nCnt : " + nCnt);
			
			if (1 ==nCnt) {
				return "GOOD";
			}else {
				return "BAD";
			}
		}
	
}
