package main.pc.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.notice.dao.NoticeDAO;
import main.pc.notice.vo.NoticeVO;
@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {
	@Autowired(required=false)
	private NoticeDAO noticeDAO;
	@Override
	public int noticeInsert(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return noticeDAO.noticeInsert(nvo);
	}
	@Override
	public List<NoticeVO> noticeSelectAll(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return noticeDAO.noticeSelectAll(nvo);
	}

	
}
