package main.pc.communities.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.communities.vo.CommunitiesVO;

@Service
@Transactional
public class CommunitiesServiceImpl implements CommunitiesService {
	Logger logger = LogManager.getLogger(getClass());

	@Override
	public int comIns(CommunitiesVO cvo) {
		logger.info("comIns() 함수진입");
		return 1;
	}

}
