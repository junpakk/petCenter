package main.pc.photo.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.communities.vo.CommunitiesVO;
import main.pc.photo.vo.PhotoVO;

@Repository
public class PhotoDAOImpl implements PhotoDAO {
	Logger logger = LogManager.getLogger(getClass());
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public int photoIns(PhotoVO pvo) {
		// TODO Auto-generated method stub
		logger.info("photoIns() 함수진입");
		return (Integer)sqlSession.insert("photoIns", pvo);
	}

	@Override
	public List<PhotoVO> photoSelAll(PhotoVO pvo) {
		// TODO Auto-generated method stub
		logger.info("photoSelAll() 함수진입");
		return sqlSession.selectList("photoSelAll", pvo);
	}

	@Override
	public List<PhotoVO> photoSelForm(PhotoVO pvo) {
		// TODO Auto-generated method stub
		logger.info("photoSelForm() 함수진입");
		return sqlSession.selectList("photoSelForm", pvo);
	}

	@Override
	public int bphitcnt(PhotoVO pvo) {
		// TODO Auto-generated method stub
		logger.info("bphitcnt 함수 진입");	
		return sqlSession.update("bphitcnt", pvo);
	}


}
