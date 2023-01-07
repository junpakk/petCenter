package main.pc.photo.service;

import java.util.List;

import main.pc.photo.vo.PhotoVO;

public interface PhotoService {

	public int photoIns(PhotoVO pvo);
	public List<PhotoVO> photoSelAll(PhotoVO pvo);
	public List<PhotoVO> photoSelForm(PhotoVO pvo);
	public int bphitcnt(PhotoVO pvo);
}
