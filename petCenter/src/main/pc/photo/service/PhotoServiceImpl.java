package main.pc.photo.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.photo.dao.PhotoDAO;
import main.pc.photo.vo.PhotoVO;

@Service
@Transactional
public class PhotoServiceImpl implements PhotoService {
	Logger logger = LogManager.getLogger(getClass());
	
	@Autowired(required=false)
	private PhotoDAO photoDAO;

	@Override
	public int photoIns(PhotoVO pvo) {
		// TODO Auto-generated method stub
		logger.info("photoIns() 함수진입");
		return photoDAO.photoIns(pvo);
	}

	@Override
	public List<PhotoVO> photoSelAll(PhotoVO pvo) {
		// TODO Auto-generated method stub
		logger.info("photoSelAll() 함수진입");
		return photoDAO.photoSelAll(pvo);
	}

	@Override
	public List<PhotoVO> photoSelForm(PhotoVO pvo) {
		// TODO Auto-generated method stub
		logger.info("photoSelForm() 함수진입");
		return photoDAO.photoSelForm(pvo);
	}

	@Override
	public int bphitcnt(PhotoVO pvo) {
		// TODO Auto-generated method stub
		logger.info("bphitcnt() 함수진입");
		return photoDAO.bphitcnt(pvo);
	}


}
