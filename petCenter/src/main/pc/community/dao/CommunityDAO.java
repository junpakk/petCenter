package main.pc.community.dao;

import java.util.List;

import main.pc.community.vo.CommunityVO;

public interface CommunityDAO {

	public int petcommunityInsert(CommunityVO covo);

	public List<CommunityVO> petcommunitySelectAll();

	public int petcommunityDelete(CommunityVO covo);

	public List<CommunityVO> petcommunitySelect(CommunityVO covo);

	public int petcommunityUpdate(CommunityVO covo);

}
