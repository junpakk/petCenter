package main.pc.login.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.login.dao.LoginDAO;
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

}
