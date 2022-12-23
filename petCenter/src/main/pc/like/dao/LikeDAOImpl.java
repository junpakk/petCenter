package main.pc.like.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.like.vo.LikeVO;

@Repository
public class LikeDAOImpl implements LikeDAO {
	Logger logger = LogManager.getLogger(LikeDAOImpl.class);

	@Autowired(required=false)
	private SqlSession sqlSession;
	
	@Override
	public List<LikeVO> likeSelect(LikeVO lvo) {
		// TODO Auto-generated method stub
		logger.info("likeSelect 함수 진입");			
		return sqlSession.selectList("likeSelect", lvo);
	}

	@Override
	public int likeUpdate(LikeVO lvo) {
		// TODO Auto-generated method stub
		logger.info("likeUpdate 함수 진입");			
		return sqlSession.update("likeUpdate", lvo);
	}

	@Override
	public int likeInsert(LikeVO lvo) {
		// TODO Auto-generated method stub
		logger.info("likeInsert 함수 진입");			
		return sqlSession.insert("likeInsert", lvo);
	}

	@Override
	public List<LikeVO> likeSelectAll(LikeVO lvo) {
		// TODO Auto-generated method stub
		logger.info("likeSelectAll 함수 진입");			
		return sqlSession.selectList("likeSelectAll", lvo);
	}

	@Override
	public int hateUpdate(LikeVO lvo) {
		// TODO Auto-generated method stub
		logger.info("hateUpdate 함수 진입");			
		return sqlSession.update("hateUpdate", lvo);
	}

}
