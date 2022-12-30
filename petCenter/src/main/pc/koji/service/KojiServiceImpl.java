package main.pc.koji.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.koji.dao.KojiDAO;
import main.pc.koji.vo.KojiVO;


@Service
@Transactional
public class KojiServiceImpl implements KojiService {
	@Autowired(required=false)
	private KojiDAO kojiDAO;
	@Override
	public int petkojiInsert(KojiVO kvo) {
		// TODO Auto-generated method stub
		return kojiDAO.petkojiInsert(kvo);
	}
	@Override
	public List<KojiVO> kojiSelectAll() {
		// TODO Auto-generated method stub
		return kojiDAO.kojiSelectAll();
	}
	@Override
	public int kojiDelete(KojiVO kvo) {
		// TODO Auto-generated method stub
		return kojiDAO.kojiDelete(kvo);
	}
	@Override
	public List<KojiVO> kojiSelect(KojiVO kvo) {
		// TODO Auto-generated method stub
		return kojiDAO.kojiSelect(kvo);
	}
	@Override
	public int kojiUpdate(KojiVO kvo) {
		// TODO Auto-generated method stub
		return kojiDAO.kojiUpdate(kvo);
	}

}
