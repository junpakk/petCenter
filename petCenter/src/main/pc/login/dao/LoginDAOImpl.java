package main.pc.login.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.login.vo.IdFindVO;
import main.pc.login.vo.PwFindVO;
import main.pc.member.vo.MemberVO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	Logger logger = LogManager.getLogger(this.getClass());
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MemberVO> loginCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("loginCheck 함수 진입 >>> : ");
		return sqlSession.selectOne("loginCheck", mvo);
	}

	@Override
	public List<MemberVO> emailCntCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("emailCntCheck 함수 진입 >>> : ");
		return sqlSession.selectList("emailCntCheck", mvo);
	}

	@Override
	public int tempAuthInsert(IdFindVO avo) {
		// TODO Auto-generated method stub
		logger.info("tempAuthInsert 함수 진입 >>> : ");
		return sqlSession.insert("tempAuthInsert", avo);
	}

	@Override
	public List<IdFindVO> idFindAuthnum(IdFindVO avo) {
		// TODO Auto-generated method stub
		logger.info("idFindAuthnum 함수 진입 >>> : ");
		return sqlSession.selectList("idFindAuthnum", avo);
	}
	
	@Override
	public List<MemberVO> idFind(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("idFind 함수 진입 >>> : ");
		return sqlSession.selectList("idFind", mvo);
	}

	@Override
	public List<MemberVO> emailCntCheckPW(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("emailCntCheckPW 함수 진입 >>> : ");
		return sqlSession.selectList("emailCntCheckPW", mvo);
	}

	@Override
	public int tempPwInsert(PwFindVO pvo) {
		// TODO Auto-generated method stub
		logger.info("tempPwInsert 함수 진입 >>> : ");
		return sqlSession.insert("tempPwInsert", pvo);
	}

	@Override
	public List<PwFindVO> pwFindAuthnum(PwFindVO pvo) {
		// TODO Auto-generated method stub
		logger.info("pwFindAuthnum 함수 진입 >>> : ");
		return sqlSession.selectList("pwFindAuthnum", pvo);
	}

	@Override
	public List<MemberVO> kakaoLogin(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("kakaoLogin 함수 진입 >>> : ");
		return sqlSession.selectList("kakaoLogin", mvo);
	}

	@Override
	public int kakaoInsert(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("kakaoInsert 함수 진입 >>> : ");
		return sqlSession.insert("kakaoInsert", mvo);
	}


}
