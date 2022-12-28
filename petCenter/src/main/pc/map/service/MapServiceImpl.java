package main.pc.map.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.map.dao.MapDAO;
import main.pc.map.vo.MapVO;

@Service
@Transactional
public class MapServiceImpl implements MapService {
	Logger logger = LogManager.getLogger(getClass());
	
	@Autowired(required=false)
	private MapDAO mapDAO;
	
	@Override
	public int walkInsert(MapVO mvo) {
		logger.info("walkInsert() 함수 진입 >>> : ");
		return mapDAO.walkInsert(mvo);
	}

	@Override
	public List<MapVO> walkHisSrch(MapVO mvo) {
		logger.info("walkHisSrch() 함수 진입 >>> : ");
		return mapDAO.walkHisSrch(mvo);
	}

	@Override
	public int walkHisDel(MapVO mvo) {
		logger.info("walkHisDel() 함수 진입 >>> : ");
		return mapDAO.walkHisDel(mvo);
	}

}
