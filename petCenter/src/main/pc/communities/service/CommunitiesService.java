package main.pc.communities.service;

import java.util.List;

import main.pc.communities.vo.CommunitiesVO;

public interface CommunitiesService {

	public int comIns(CommunitiesVO cvo);
	public List<CommunitiesVO> comSelAll(CommunitiesVO cvo);
	public List<CommunitiesVO> comSelForm(CommunitiesVO cvo);
	public int bchitcnt(CommunitiesVO cvo);
	public List<CommunitiesVO> tipSelAll(CommunitiesVO cvo);
}
