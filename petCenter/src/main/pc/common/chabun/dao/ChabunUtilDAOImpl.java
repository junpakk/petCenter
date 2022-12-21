package main.pc.common.chabun.dao;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.member.vo.MemberVO;

@Repository
public class ChabunUtilDAOImpl implements ChabunUtilDAO {
	Logger logger = LogManager.getLogger(getClass());
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberVO getChabunMember() {
		// TODO Auto-generated method stub
		logger.info("getChabunMember() 함수 진입 >>> : ");
		return sqlSession.selectOne("getChabunMember");
	}

}
