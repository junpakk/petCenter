package main.pc.like.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.like.dao.LikeDAO;
import main.pc.like.vo.LikeVO;

@Service
@Transactional
public class LikeServiceImpl implements LikeService {
	Logger logger = LogManager.getLogger(LikeServiceImpl.class);
	
	@Autowired(required=false)	
	private LikeDAO likeDAO;
	
	
	@Override
	public List<LikeVO> likeSelect(LikeVO lvo) {
		// TODO Auto-generated method stub
		logger.info("likeSelect 함수 진입");			
		return likeDAO.likeSelect(lvo);
	}

	@Override
	public int likeUpdate(LikeVO lvo) {
		// TODO Auto-generated method stub
		logger.info("likeUpdate 함수 진입");			
		return likeDAO.likeUpdate(lvo);
	}

	@Override
	public int likeInsert(LikeVO lvo) {
		// TODO Auto-generated method stub
		logger.info("likeInsert 함수 진입");			
		return likeDAO.likeInsert(lvo);
	}

	@Override
	public List<LikeVO> likeSelectAll(LikeVO lvo) {
		// TODO Auto-generated method stub
		logger.info("likeSelectAll 함수 진입");			
		return likeDAO.likeSelectAll(lvo);
	}

	@Override
	public int hateUpdate(LikeVO lvo) {
		// TODO Auto-generated method stub
		logger.info("hateUpdate 함수 진입");			
		return likeDAO.hateUpdate(lvo);
	}

}
