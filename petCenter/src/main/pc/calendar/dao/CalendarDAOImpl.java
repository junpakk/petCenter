package main.pc.calendar.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.calendar.vo.CalendarVO;

@Repository
public class CalendarDAOImpl implements CalendarDAO {
	Logger logger = LogManager.getLogger(CalendarDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CalendarVO> calendarSelectAll(CalendarVO cvo) {
		// TODO Auto-generated method stub
		logger.info("calendarSelectAll 진입 성공 >>> :");
	
		return sqlSession.selectList("calendarSelectAll");
	}

	@Override
	public int calendarInsert(CalendarVO cvo) {
		// TODO Auto-generated method stub
		logger.info("calendarInsert 진입 성공 >>> :");
		
		return sqlSession.insert("calendarInsert");
	}

}
