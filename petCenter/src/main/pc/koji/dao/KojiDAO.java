package main.pc.koji.dao;

import java.util.List;

import main.pc.koji.vo.KojiVO;

public interface KojiDAO {

	int petkojiInsert(KojiVO kvo);

	List<KojiVO> kojiSelectAll();

	int kojiDelete(KojiVO kvo);

	List<KojiVO> kojiSelect(KojiVO kvo);

	int kojiUpdate(KojiVO kvo);

}
