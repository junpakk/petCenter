package main.pc.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.community.dao.CommunityDAO;
import main.pc.community.vo.CommunityVO;


@Service
@Transactional
public class CommunityServiceImpl implements CommunityService {

	
	@Autowired(required=false)
	private CommunityDAO communityDAO;
	
	@Override
	public int petcommunityInsert(CommunityVO covo) {
		// TODO Auto-generated method stub
		return communityDAO.petcommunityInsert(covo);
	}

	@Override
	public List<CommunityVO> petcommunitySelectAll() {
		// TODO Auto-generated method stub
		return communityDAO.petcommunitySelectAll();
	}

	@Override
	public int petcommunityDelete(CommunityVO covo) {
		// TODO Auto-generated method stub
		return communityDAO.petcommunityDelete(covo);
	}

	@Override
	public List<CommunityVO> petcommunitySelect(CommunityVO covo) {
		// TODO Auto-generated method stub
		return communityDAO.petcommunitySelect(covo);
	}

	@Override
	public int petcommunityUpdate(CommunityVO covo) {
		// TODO Auto-generated method stub
		return communityDAO.petcommunityUpdate(covo);
	}

}
