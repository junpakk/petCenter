package main.pc.zang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.zang.vo.ZangVO;
import main.pc.zang.dao.ZangDAO;


@Service
@Transactional
public class ZangServiceImpl implements ZangService {
	
	
	@Autowired(required=false)
	private ZangDAO zangDAO;
	
	@Override
	public int petzangInsert(ZangVO zvo) {
		// TODO Auto-generated method stub
		return zangDAO.petzangInsert(zvo);
	}

	@Override
	public List<ZangVO> petzangSelectAll() {
		// TODO Auto-generated method stub
		return zangDAO.petzangSelectAll();
	}

	@Override
	public int petzangDelete(ZangVO zvo) {
		// TODO Auto-generated method stub
		return zangDAO.petzangDelete(zvo);
	}

	@Override
	public List<ZangVO> petzangSelect(ZangVO zvo) {
		// TODO Auto-generated method stub
		return zangDAO.petzangSelect(zvo);
	}

	@Override
	public int petzangUpdate(ZangVO zvo) {
		// TODO Auto-generated method stub
		return zangDAO.petzangUpdate(zvo);
	}


}
