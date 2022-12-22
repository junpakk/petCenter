package main.pc.common.chabun.dao;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.like.vo.LikeVO;
import main.pc.reply.vo.ReplyVO;

@Repository
public class ChabunUtilDAOImpl implements ChabunUtilDAO {
	Logger logger = LogManager.getLogger(ChabunUtilDAOImpl.class);

	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ReplyVO getReplyChabun() {
		// TODO Auto-generated method stub
		logger.info("getReplyChabun 함수 진입");
		
		return sqlSession.selectOne("getReplyChabun");
	
	}

	@Override
	public LikeVO getLikeChabun() {
		// TODO Auto-generated method stub
		logger.info("getLikeChabun 함수 진입");
		
		return sqlSession.selectOne("getLikeChabun");
	}

}
