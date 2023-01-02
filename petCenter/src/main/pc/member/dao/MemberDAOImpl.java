package main.pc.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	Logger logger = LogManager.getLogger(getClass());
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	@Override
	public int memInsert(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("memInsert() 함수 진입 >>> : ");
		return sqlSession.insert("memInsert", mvo);
	}

	@Override
	public List<MemberVO> memSelectAll(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("memSelectAll() 함수 진입 >>> : ");
		return sqlSession.selectList("memSelectAll", mvo);
	}

	@Override
	public List<MemberVO> memSelect(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("memSelect() 함수 진입 >>> : ");
		return sqlSession.selectList("memSelect", mvo);
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
		return sqlSession.update("memUpdate", mvo);
	}

	@Override
	public int memDelete(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("memDelete() 함수 진입 >>> : ");
		return sqlSession.update("memDelete", mvo);
	}

	@Override
	public List<MemberVO> memIdCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memIdCheck", mvo);
	}

	@Override
	public List<MemberVO> memPwCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memPwCheck", mvo);
	}

	@Override
	public int memPwUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("memPwUpdate", mvo);
	}

}
