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
		lvo.setLikey(req.getParameter("likey"));
		logger.info("like1 Likey : " + lvo.getLikey());
		logger.info("like1 Mnum : " + lvo.getMnum());
		logger.info("like1 Bcnum : " + lvo.getBcnum());
		
		
		
		
		lvo.setBlnum(blnum);
		
		
		List<LikeVO> listCnt = likeService.likeSelect(lvo);
		logger.info("like1 listCnt : " + listCnt);
		
		int nCnt = 0;
		if (listCnt != null && listCnt.size() > 0) {
			lvo.setLikey(String.valueOf(Integer.parseInt(lvo.getLikey())+1));
			nCnt = likeService.likeUpdate(lvo);
			logger.info("like1 nCnt : " + nCnt);
		}else {
			nCnt = likeService.likeInsert(lvo);
			logger.info("like1 nCnt : " + nCnt);
			lvo.setLikey(String.valueOf(1));
			nCnt = likeService.likeUpdate(lvo);
			logger.info("like2 nCnt : " + nCnt);
		}
		
		String like_cnt = "";
		List<LikeVO> listAll = likeService.likeSelectAll(lvo);
		logger.info("listAll : " + listAll);
		if(listAll !=null && listAll.size() > 0) {
			like_cnt = listAll.get(0).getLikey();
			logger.info("like_cnt : " + like_cnt);
		}
		return like_cnt;
		
	}
	
	// 반대
		@GetMapping("hate1")
		@ResponseBody
		public String hate1(LikeVO lvo) {	
		
			String blnum = ChabunUtil.getLikeChabun("D", chabunUtilService.getLikeChabun().getBlnum());
			logger.info("hate1 blnum : " + blnum);

			lvo.setBlnum(blnum);
			
			List<LikeVO> listCnt = likeService.likeSelect(lvo);
			logger.info("hate1 listCnt : " + listCnt);
			
			int nCnt = 0;
			if (listCnt !=null && listCnt.size() > 0) {
				nCnt = likeService.hateUpdate(lvo);
				logger.info("hate1 nCnt : " + nCnt);			
			}else {
				nCnt = likeService.likeInsert(lvo);
				logger.info("hate1 nCnt : " + nCnt);
				nCnt = likeService.hateUpdate(lvo);
				logger.info("hate2 nCnt : " + nCnt);
			}
								
			String hate_cnt = "";
			List<LikeVO> listAll = likeService.likeSelectAll(lvo);
			logger.info("listAll : " + listAll);
			if (listAll !=null && listAll.size() > 0) {
				
				hate_cnt = listAll.get(0).getHate();
				logger.info("hate_cnt : " + hate_cnt);
			}
					
			return hate_cnt;
		}	
}
