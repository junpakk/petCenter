package main.pc.calendar.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.calendar.dao.CalendarDAO;
import main.pc.calendar.vo.CalendarVO;

@Service
@Transactional
public class CalendarServiceImpl implements CalendarService {
	Logger logger = LogManager.getLogger(CalendarServiceImpl.class);
	
	@Autowired(required = false)
	private CalendarDAO calendarDAO;

	@Override
	public List<CalendarVO> calendarSelectAll(CalendarVO cvo) {
		// TODO Auto-generated method stub
		logger.info("calendarSelectAll 진입 성공 >>> : ");
		
		return calendarDAO.calendarSelectAll(cvo);
	}

	@Override
	public int calendarInsert(CalendarVO cvo) {
		// TODO Auto-generated method stub
		logger.info("CalendarServiceImpl calendarInsert 진입 성공 >>> : ");
		
		return calendarDAO.calendarInsert(cvo);
	}

	@Override
	public int calendarDelete(CalendarVO cvo) {
		// TODO Auto-generated method stub
		logger.info("CalendarServiceImpl calendarDelete 진입 성공 >>> : ");
		
		return calendarDAO.calendarDelete(cvo);
	}

}
