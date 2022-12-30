package main.pc.fair.service;

import java.util.List;

import main.pc.fair.vo.FairVO;

public interface FairService {

	public int fairInsert(FairVO fvo);

	public List<FairVO> fairSelectAll(FairVO fvo);

	public int fairDelete(FairVO fvo);

	public List<FairVO> fairSelect(FairVO fvo);

}
