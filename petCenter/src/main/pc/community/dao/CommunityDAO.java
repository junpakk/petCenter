package main.pc.community.dao;

import java.util.List;

import main.pc.community.vo.CommunityVO;

public interface CommunityDAO {

	int petcommunityInsert(CommunityVO covo);

	List<CommunityVO> petcommunitySelectAll();

	int petcommunityDelete(CommunityVO covo);

	List<CommunityVO> petcommunitySelect(CommunityVO covo);

	int petcommunityUpdate(CommunityVO covo);

}
