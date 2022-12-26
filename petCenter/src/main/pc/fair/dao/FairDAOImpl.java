package main.pc.fair.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.fair.vo.FairVO;

@Repository
public class FairDAOImpl implements FairDAO {
	Logger logger = LogManager.getLogger(FairDAOImpl.class);
	
	//마이바티스 쿼리 연결
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	@Override
	public int fairInsert(FairVO fvo) {
		// TODO Auto-generated method stub
		logger.info("fairInsert() 진입: ");
		return (Integer)sqlSession.insert("fairInsert", fvo);
	}

	@Override
	public List<FairVO> fairSelectAll(FairVO fvo) {
		// TODO Auto-generated method stub
		logger.info("fairSelectAll() 진입: ");
		return sqlSession.selectList("fairSelectAll", fvo);
	}

	@Override
	public int fairDelete(FairVO fvo) {
		// TODO Auto-generated method stub
		logger.info("fairDelete() 진입: ");
		return sqlSession.update("fairDelete", fvo);
	}

}
