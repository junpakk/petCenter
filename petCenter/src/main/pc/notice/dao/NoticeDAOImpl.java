package main.pc.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.notice.vo.NoticeVO;


@Repository
public class NoticeDAOImpl implements NoticeDAO {
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	@Override
	public int noticeInsert(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("noticeInsert", nvo);
	}
	@Override
	public List<NoticeVO> noticeSelectAll(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeSelectAll", nvo);
	}

	

}
