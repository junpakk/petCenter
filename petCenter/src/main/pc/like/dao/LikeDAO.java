package main.pc.like.dao;

import java.util.List;

import main.pc.like.vo.LikeVO;

public interface LikeDAO {

	public List<LikeVO> likeSelect(LikeVO lvo);

	public int likeUpdate(LikeVO lvo);

	public int likeInsert(LikeVO lvo);

	public List<LikeVO> likeSelectAll(LikeVO lvo);

	public int hateUpdate(LikeVO lvo);

}
