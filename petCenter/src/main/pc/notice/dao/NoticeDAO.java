package main.pc.notice.dao;

import java.util.List;

import main.pc.notice.vo.NoticeVO;

public interface NoticeDAO {

	public int noticeInsert(NoticeVO nvo);

	public List<NoticeVO> noticeSelectAll(NoticeVO nvo);

	

	

	

	

	

}
