package main.pc.member.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.member.dao.MemberDAO;
import main.pc.member.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	Logger logger = LogManager.getLogger(getClass());
	
	@Autowired(required=false)
	private MemberDAO memberDAO;
	
	@Override
	public int memInsert(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("memInsert() 함수 진입 >>> : ");
		return memberDAO.memInsert(mvo);
	}

	@Override
	public List<MemberVO> memSelectAll(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("memSelectAll() 함수 진입 >>> : ");
		return memberDAO.memSelectAll(mvo);
	}

	@Override
	public List<MemberVO> memSelect(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("memSelect() 함수 진입 >>> : ");
		return memberDAO.memSelect(mvo);
	}

	@Override
	public List<MemberVO> memSelectForm(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("memSelectForm() 함수 진입 >>> : ");
		return null;
	}

	@Override
	public int memUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("memUpdate() 함수 진입 >>> : ");
		return memberDAO.memUpdate(mvo);
	}

	@Override
	public int memDelete(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("memDelete() 함수 진입 >>> : ");
		return memberDAO.memDelete(mvo);
	}

	@Override
	public List<MemberVO> memIdCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("memIdCheck() 함수 진입 >>> : ");
		return memberDAO.memIdCheck(mvo);
	}

	@Override
	public List<MemberVO> memPwCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("memPwCheck() 함수 진입 >>> : ");
		return memberDAO.memPwCheck(mvo);
	}

	@Override
	public int memPwUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("memPwUpdate() 함수 진입 >>> : ");
		return memberDAO.memPwUpdate(mvo);
	}

}
