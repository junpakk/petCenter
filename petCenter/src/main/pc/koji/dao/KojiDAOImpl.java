package main.pc.koji.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.koji.vo.KojiVO;


@Repository
public class KojiDAOImpl implements KojiDAO {
	
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int petkojiInsert(KojiVO kvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("petkojiInsert", kvo);
	}


	@Override
	public List<KojiVO> kojiSelectAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kojiSelectAll");
	}


	@Override
	public int kojiDelete(KojiVO kvo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("kojiDelete", kvo);
	}


	@Override
	public List<KojiVO> kojiSelect(KojiVO kvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kojiSelect", kvo);
	}


	@Override
	public int kojiUpdate(KojiVO kvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("kojiUpdate", kvo);
	}

}
