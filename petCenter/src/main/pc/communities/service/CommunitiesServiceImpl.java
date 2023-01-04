package main.pc.communities.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.communities.dao.CommunitiesDAO;
import main.pc.communities.vo.CommunitiesVO;

@Service
@Transactional
public class CommunitiesServiceImpl implements CommunitiesService {
	Logger logger = LogManager.getLogger(getClass());
	
	@Autowired(required=false)
	private CommunitiesDAO communitiesDAO;

	@Override
	public int comIns(CommunitiesVO cvo) {
		logger.info("comIns() 함수진입");
		return communitiesDAO.comIns(cvo);
	}

	@Override
	public List<CommunitiesVO> comSelAll(CommunitiesVO cvo) {
		logger.info("comSelAll() 함수진입");
		return communitiesDAO.comSelAll(cvo);
	}

}
