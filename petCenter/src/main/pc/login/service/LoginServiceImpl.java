package main.pc.login.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.login.dao.LoginDAO;
import main.pc.login.vo.IdFindVO;
import main.pc.login.vo.PwFindVO;
import main.pc.member.vo.MemberVO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {
	Logger logger = LogManager.getLogger(this.getClass());

	@Autowired(required=false)
	private LoginDAO loginDAO;
	
	@Override
	public List<MemberVO> loginCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("loginCheck 함수 진입 >>> : ");
		return loginDAO.loginCheck(mvo);
	}

	@Override
	public List<MemberVO> emailCntCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("emailCntCheck 함수 진입 >>> : ");
		return loginDAO.emailCntCheck(mvo);
	}

	@Override
	public int tempAuthInsert(IdFindVO avo) {
		// TODO Auto-generated method stub
		logger.info("tempAuthInsert 함수 진입 >>> : ");
		return loginDAO.tempAuthInsert(avo);
	}

	@Override
	public List<IdFindVO> idFindAuthnum(IdFindVO avo) {
		// TODO Auto-generated method stub
		logger.info("idFindAuthnum 함수 진입 >>> : ");
		return loginDAO.idFindAuthnum(avo);
	}

	@Override
	public List<MemberVO> idFind(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("idFind 함수 진입 >>> : ");
		return loginDAO.idFind(mvo);
	}

	@Override
	public List<MemberVO> emailCntCheckPW(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("emailCntCheckPW 함수 진입 >>> : ");
		return loginDAO.emailCntCheckPW(mvo);
	}

	@Override
	public int tempPwInsert(PwFindVO pvo) {
		// TODO Auto-generated method stub
		logger.info("tempPwInsert 함수 진입 >>> : ");
		return loginDAO.tempPwInsert(pvo);
	}

	@Override
	public List<PwFindVO> pwFindAuthnum(PwFindVO pvo) {
		// TODO Auto-generated method stub
		logger.info("pwFindAuthnum 함수 진입 >>> : ");
		return loginDAO.pwFindAuthnum(pvo);
	}

	@Override
	public List<MemberVO> snsLogin(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("snsLogin 함수 진입 >>> : ");
		return loginDAO.snsLogin(mvo);
	}

	@Override
	public int snsInsert(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("snsInsert 함수 진입 >>> : ");
		return loginDAO.snsInsert(mvo);
	}
}
