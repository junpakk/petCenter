package main.pc.like.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.pc.common.ChabunUtil;
import main.pc.common.chabun.service.ChabunUtilService;
import main.pc.like.service.LikeService;
import main.pc.like.vo.LikeVO;

@Controller
public class LikeController {
	Logger logger = LogManager.getLogger(LikeController.class);
	
	// 서비스 연결
	@Autowired(required=false)
	private LikeService likeService;
	
	// 채번 연결
	@Autowired(required=false)
	private ChabunUtilService chabunUtilService;
	
	// 좋아요
	@GetMapping("like1")
	@ResponseBody
	public String like1(LikeVO lvo, HttpServletRequest req) {
		
		String blnum = ChabunUtil.getLikeChabun("D", chabunUtilService.getLikeChabun().getBlnum());
		logger.info("like1 blnum : " + blnum);
		
		LikeVO lvo1 = null;
		lvo = new LikeVO();
		
		lvo1.setBlnum(blnum);
		lvo1.setMnum(req.getParameter("mnum"));
		lvo1.setLikey(req.getParameter("like"));
		lvo1.setBcnum(req.getParameter("bcnum"));
		
		List<LikeVO> listCnt = likeService.likeSelect(lvo);
		logger.info("like1 listCnt : " + listCnt);
		
		int nCnt = 0;
		if (listCnt != null && listCnt.size() > 0) {
			nCnt = likeService.likeUpdate(lvo);
			logger.info("like1 nCnt : " + nCnt);
		}else {
			nCnt = likeService.likeInsert(lvo);
			logger.info("like1 nCnt : " + nCnt);
		}
		
		String like_cnt = "";
		List<LikeVO> listAll = likeService.likeSelectAll(lvo);
		if(listAll !=null && listAll.size() > 0) {
			like_cnt = listAll.get(0).getLikey();
		}
		return like_cnt;
		
	}
	
	// 반대
		@GetMapping("hate1")
		@ResponseBody
		public String hate1(LikeVO lvo) {	
			
			
			List<LikeVO> listCnt = likeService.likeSelect(lvo);
			logger.info("kmjLikecnt_2 listCnt >>> : " + listCnt);
			
			int nCnt = 0;
			if (listCnt !=null && listCnt.size() > 0) {
				nCnt = likeService.hateUpdate(lvo);
				logger.info("kmjLikecnt_2 nCnt : " + nCnt);			
			}else {
				nCnt = likeService.likeInsert(lvo);
				logger.info("kmjLikecnt_2 nCnt : " + nCnt);		
			}
								
			String hate_cnt = "";
			List<LikeVO> listAll = likeService.likeSelectAll(lvo);
			if (listAll !=null && listAll.size() > 0) {
				hate_cnt = listAll.get(0).getHate();
			}
					
			return hate_cnt;
		}	
}