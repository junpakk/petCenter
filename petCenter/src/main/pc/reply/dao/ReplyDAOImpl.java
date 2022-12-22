package main.pc.reply.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.reply.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	Logger logger = LogManager.getLogger(ReplyDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int replyInsert(ReplyVO rvo) {
		// TODO Auto-generated method stub
		logger.info("replyInsert 함수 진입 : ");			
		return sqlSession.insert("replyInsert", rvo);
	}

	@Override
	public List<ReplyVO> replySelectAll(ReplyVO rvo) {
		// TODO Auto-generated method stub
		logger.info("replySelectAll 함수 진입 : ");			
		return sqlSession.selectList("replySelectAll", rvo);
	}

	@Override
	public int replyDelete(ReplyVO rvo) {
		// TODO Auto-generated method stub
		logger.info("replyDelete 함수 진입 : ");			
		return sqlSession.update("replyDelete", rvo);
	}

}
