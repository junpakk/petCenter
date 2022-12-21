package main.pc.common.chabun.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.common.chabun.dao.ChabunUtilDAO;
import main.pc.member.vo.MemberVO;

@Service
@Transactional
public class ChabunUtilServiceImpl implements ChabunUtilService {
	Logger logger = LogManager.getLogger(getClass());
	
	@Autowired(required=false)
	private ChabunUtilDAO chabunUtilDAO;
	
	@Override
	public MemberVO getChabunMember() {
		// TODO Auto-generated method stub
		logger.info("getChabunMember() 함수 진입 >>> : ");
		return chabunUtilDAO.getChabunMember();
	}

}
