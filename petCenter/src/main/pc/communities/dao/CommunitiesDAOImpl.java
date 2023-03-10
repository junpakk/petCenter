package main.pc.communities.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.communities.vo.CommunitiesVO;

@Repository
public class CommunitiesDAOImpl implements CommunitiesDAO {
	Logger logger = LogManager.getLogger(getClass());
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int comIns(CommunitiesVO cvo) {
		logger.info("comIns() 함수진입");
		return (Integer)sqlSession.insert("comIns", cvo);
	}

	@Override
	public List<CommunitiesVO> comSelAll(CommunitiesVO cvo) {
		logger.info("comSelAll() 함수진입");
		return sqlSession.selectList("comSelAll", cvo);
	}

	@Override
	public List<CommunitiesVO> comSelForm(CommunitiesVO cvo) {
		// TODO Auto-generated method stub
		logger.info("comSelForm() 함수진입");
		return sqlSession.selectList("comSelForm", cvo);
	}
	
	@Override
	public int bchitcnt(CommunitiesVO cvo) {
		// TODO Auto-generated method stub
		logger.info("bhitcnt 함수 진입");	
		
		return sqlSession.update("bchitcnt", cvo);
	}

	@Override
	public List<CommunitiesVO> tipSelAll(CommunitiesVO cvo) {
		// TODO Auto-generated method stub
		logger.info("tipSelAll() 함수진입");
		return sqlSession.selectList("tipSelAll", cvo);
	}


}
