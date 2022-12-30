package main.pc.community.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.community.vo.CommunityVO;


@Repository
public class CommunityDAOImpl implements CommunityDAO {
	
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int petcommunityInsert(CommunityVO covo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("petcommunityInsert", covo);
	}

	@Override
	public List<CommunityVO> petcommunitySelectAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("petcommunitySelectAll");
	}

	@Override
	public int petcommunityDelete(CommunityVO covo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("petcommunityDelete", covo);
	}

	@Override
	public List<CommunityVO> petcommunitySelect(CommunityVO covo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("petcommunitySelect", covo);
	}

	@Override
	public int petcommunityUpdate(CommunityVO covo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("petcommunityUpdate", covo);
	}
	

}
