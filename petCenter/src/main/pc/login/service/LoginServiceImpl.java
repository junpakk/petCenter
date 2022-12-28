package main.pc.login.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.login.dao.LoginDAO;
import main.pc.login.vo.TempAuthVO;
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
		return loginDAO.loginCheck(mvo);
	}

	@Override
	public List<MemberVO> emailCntCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		return loginDAO.emailCntCheck(mvo);
	}

	@Override
	public int tempAuthInsert(TempAuthVO avo) {
		// TODO Auto-generated method stub
		return loginDAO.tempAuthInsert(avo);
	}

	@Override
	public List<TempAuthVO> idFindAuthnum(TempAuthVO avo) {
		// TODO Auto-generated method stub
		return loginDAO.idFindAuthnum(avo);
	}

	@Override
	public List<MemberVO> idFind(MemberVO mvo) {
		// TODO Auto-generated method stub
		return loginDAO.idFind(mvo);
	}
}
