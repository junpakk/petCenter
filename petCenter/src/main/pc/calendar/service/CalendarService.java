package main.pc.calendar.service;

import java.util.List;

import main.pc.calendar.vo.CalendarVO;

public interface CalendarService {

	public List<CalendarVO> calendarSelectAll(CalendarVO cvo);
	public int calendarInsert(CalendarVO cvo);

}
