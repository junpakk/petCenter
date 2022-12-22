package main.pc.common.chabun.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.common.chabun.dao.ChabunUtilDAO;
import main.pc.like.vo.LikeVO;
import main.pc.reply.vo.ReplyVO;

@Service
@Transactional
public class ChabunUtilServiceImpl implements ChabunUtilService {
	Logger logger = LogManager.getLogger(ChabunUtilServiceImpl.class);
	
	@Autowired(required=false)
	private ChabunUtilDAO pcChabunUtilDAO;
	
	@Override
	public ReplyVO getReplyChabun() {
		// TODO Auto-generated method stub
		logger.info("getReplyChabun 함수 진입 : ");
		return pcChabunUtilDAO.getReplyChabun();
	}

	@Override
	public LikeVO getLikeChabun() {
		// TODO Auto-generated method stub
		logger.info("getLikeChabun 함수 진입 : ");
		return pcChabunUtilDAO.getLikeChabun();
	}

}
