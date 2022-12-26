package main.pc.fair.dao;

import java.util.List;

import main.pc.fair.vo.FairVO;

public interface FairDAO {

	public int fairInsert(FairVO fvo);

	public List<FairVO> fairSelectAll(FairVO fvo);

	public int fairDelete(FairVO fvo);

}
