package main.pc.communities.service;

import java.util.List;

import main.pc.communities.vo.CommunitiesVO;

public interface CommunitiesService {

	public int comIns(CommunitiesVO cvo);
	public List<CommunitiesVO> comSelAll(CommunitiesVO cvo);
}
