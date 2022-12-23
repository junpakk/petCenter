package main.pc.reply.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.reply.dao.ReplyDAO;
import main.pc.reply.vo.ReplyVO;

@Service
@Transactional
public class ReplyServiceImpl implements ReplyService {
	Logger logger = LogManager.getLogger(ReplyServiceImpl.class);

	@Autowired(required=false)	
	private ReplyDAO replyDAO;
	
	@Override
	public int replyInsert(ReplyVO rvo) {
		// TODO Auto-generated method stub
		logger.info("replyInsert 함수 진입 : ");			
		return replyDAO.replyInsert(rvo);
	}

	@Override
	public List<ReplyVO> replySelectAll(ReplyVO rvo) {
		// TODO Auto-generated method stub
		logger.info("replySelectAll 함수 진입 : ");			
		return replyDAO.replySelectAll(rvo);
	}

	@Override
	public int replyDelete(ReplyVO rvo) {
		// TODO Auto-generated method stub
		logger.info("replyDelete 함수 진입 : ");			
		return replyDAO.replyDelete(rvo);
	}

}
