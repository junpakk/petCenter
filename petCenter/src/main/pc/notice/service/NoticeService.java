package main.pc.notice.service;

import java.util.List;

import main.pc.notice.vo.NoticeVO;

public interface NoticeService {

	int noticeInsert(NoticeVO nvo);

	List<NoticeVO> noticeSelectAll(NoticeVO nvo);

	

	

	



}
