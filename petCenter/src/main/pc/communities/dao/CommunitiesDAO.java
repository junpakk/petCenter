package main.pc.communities.dao;

import java.util.List;

import main.pc.communities.vo.CommunitiesVO;

public interface CommunitiesDAO {
	
	public int comIns(CommunitiesVO cvo);
	public List<CommunitiesVO> comSelAll(CommunitiesVO cvo);

}
