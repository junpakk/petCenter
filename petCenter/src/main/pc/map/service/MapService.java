package main.pc.map.service;

import java.util.List;

import main.pc.map.vo.MapVO;

public interface MapService {
	
	public int walkInsert(MapVO mvo);
	public List<MapVO>walkHisSrch(MapVO mvo);
	public int walkHisDel(MapVO mvo);

}
