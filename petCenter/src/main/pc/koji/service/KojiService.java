package main.pc.koji.service;

import java.util.List;

import main.pc.koji.vo.KojiVO;

public interface KojiService {

	int petkojiInsert(KojiVO kvo);

	List<KojiVO> kojiSelectAll();

	int kojiDelete(KojiVO kvo);

	List<KojiVO> kojiSelect(KojiVO kvo);

	int kojiUpdate(KojiVO kvo);

	

}
