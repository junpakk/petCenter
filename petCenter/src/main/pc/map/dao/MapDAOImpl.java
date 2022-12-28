package main.pc.map.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.map.vo.MapVO;

@Repository
public class MapDAOImpl implements MapDAO {
	Logger logger = LogManager.getLogger(getClass());
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	@Override
	public int walkInsert(MapVO mvo) {
		logger.info("walkInsert() 함수 진입 >>> : ");
		return sqlSession.insert("walkInsert", mvo);
	}

	@Override
	public List<MapVO> walkHisSrch(MapVO mvo) {
		logger.info("walkHisSrch() 함수 진입 >>> ");
		return sqlSession.selectList("walkHisSrch",mvo);
	}

	@Override
	public int walkHisDel(MapVO mvo) {
		logger.info("walkHisDel() 함수 진입 >>> ");
		return (Integer)sqlSession.update("walkHisDel", mvo);
	}

}
