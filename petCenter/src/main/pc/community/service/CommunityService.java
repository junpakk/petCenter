package main.pc.community.service;

import java.util.List;

import main.pc.community.vo.CommunityVO;

public interface CommunityService {

	int petcommunityInsert(CommunityVO covo);

	List<CommunityVO> petcommunitySelectAll();

	int petcommunityDelete(CommunityVO covo);

	

	List<CommunityVO> petcommunitySelect(CommunityVO covo);

	int petcommunityUpdate(CommunityVO covo);

}
