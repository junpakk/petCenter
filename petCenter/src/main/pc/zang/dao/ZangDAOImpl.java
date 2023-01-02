package main.pc.zang.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.zang.vo.ZangVO;



@Repository
public class ZangDAOImpl implements ZangDAO {
	
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int petzangInsert(ZangVO zvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("petzangInsert", zvo);
	}

	@Override
	public List<ZangVO> petzangSelectAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("petzangSelectAll");
	}

	@Override
	public int petzangDelete(ZangVO zvo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("petzangDelete", zvo);
	}

	@Override
	public List<ZangVO> petzangSelect(ZangVO zvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("petzangSelect", zvo);
	}

	@Override
	public int petzangUpdate(ZangVO zvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("petzangUpdate", zvo);
	}

}
