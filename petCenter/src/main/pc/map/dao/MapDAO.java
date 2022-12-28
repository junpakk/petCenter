package main.pc.map.dao;

import java.util.List;

import main.pc.map.vo.MapVO;

public interface MapDAO {

	public int walkInsert(MapVO mvo);
	public List<MapVO>walkHisSrch(MapVO mvo);
	public int walkHisDel(MapVO mvo);
}
