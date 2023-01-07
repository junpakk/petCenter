package main.pc.photo.dao;

import java.util.List;

import main.pc.photo.vo.PhotoVO;

public interface PhotoDAO {
	
	public int photoIns(PhotoVO pvo);
	public List<PhotoVO> photoSelAll(PhotoVO pvo);
	public List<PhotoVO> photoSelForm(PhotoVO pvo);
	public int bphitcnt(PhotoVO pvo);

}
