package main.pc.login.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.login.vo.TempAuthVO;
import main.pc.member.vo.MemberVO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	Logger logger = LogManager.getLogger(this.getClass());
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MemberVO> loginCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("loginCheck", mvo);
	}

	@Override
	public List<MemberVO> emailCntCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("emailCntCheck", mvo);
	}

	@Override
	public int tempAuthInsert(TempAuthVO avo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("tempAuthInsert", avo);
	}

	@Override
	public List<TempAuthVO> idFindAuthnum(TempAuthVO avo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("idFindAuthnum", avo);
	}
	
	@Override
	public List<MemberVO> idFind(MemberVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("idFind", mvo);
	}


}
