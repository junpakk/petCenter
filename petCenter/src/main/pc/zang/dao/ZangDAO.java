package main.pc.zang.dao;

import java.util.List;

import main.pc.zang.vo.ZangVO;

public interface ZangDAO {

	int petzangInsert(ZangVO zvo);

	List<ZangVO> petzangSelectAll();

	int petzangDelete(ZangVO zvo);

	List<ZangVO> petzangSelect(ZangVO zvo);

	int petzangUpdate(ZangVO zvo);

}
