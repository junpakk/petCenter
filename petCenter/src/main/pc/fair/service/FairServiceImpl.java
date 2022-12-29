package main.pc.fair.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.fair.dao.FairDAO;
import main.pc.fair.vo.FairVO;

@Service
@Transactional
public class FairServiceImpl implements FairService {
	Logger logger = LogManager.getLogger(FairServiceImpl.class);
	
	@Autowired(required=false)
	private FairDAO fairDAO;

	@Override
	public int fairInsert(FairVO fvo) {
		// TODO Auto-generated method stub
		logger.info("fairInsert() 진입: ");
		return fairDAO.fairInsert(fvo);
	}

	@Override
	public List<FairVO> fairSelectAll(FairVO fvo) {
		// TODO Auto-generated method stub
		logger.info("fairSelectAll() 진입: ");
		return fairDAO.fairSelectAll(fvo);
	}

	@Override
	public int fairDelete(FairVO fvo) {
		// TODO Auto-generated method stub
		logger.info("fairDelete() 진입: ");
		return fairDAO.fairDelete(fvo);
	}

	@Override
	public List<FairVO> fairSelect(FairVO fvo) {
		// TODO Auto-generated method stub
		logger.info("fairSelect() 진입: ");
		return fairDAO.fairSelect(fvo);
	}

}
