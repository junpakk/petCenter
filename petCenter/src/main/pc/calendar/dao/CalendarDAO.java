package main.pc.calendar.dao;

import java.util.List;

import main.pc.calendar.vo.CalendarVO;

public interface CalendarDAO {

	public List<CalendarVO> calendarSelectAll(CalendarVO cvo);
	public int calendarInsert(CalendarVO cvo);

}
