package main.pc.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.cart.vo.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {
	Logger logger = LogManager.getLogger(CartDAOImpl.class);

	@Autowired(required=false)
	private SqlSession sqlSession;

	//장바구니 I
	@Override
	public int cartInsert(CartVO cvo) {
		// TODO Auto-generated method stub
		logger.info("cartInsert() 진입: ");
		return (Integer)sqlSession.insert("cartInsert", cvo);
	}

	//회원병 장바구니 S
	@Override
	public List<CartVO> cartSelectAll(String mnum) {
		// TODO Auto-generated method stub
		logger.info("cartSelectAll() 진입: ");
		return sqlSession.selectList("cartSelectAll", mnum);
	}

//	@Override
//	public List<CartVO> cartSelectAll(CartVO cvo) {
//		// TODO Auto-generated method stub
//		logger.info("cartSelectAll() 진입: ");
//		return sqlSession.selectList("cartSelectAll", cvo);
//	}
//
//	//한건 클릭 삭제
//	@Override
//	public int cartDelete(CartVO cvo) {
//		// TODO Auto-generated method stub
//		logger.info("cartDelete() 진입: ");
//		return sqlSession.update("cartDelete", cvo);
//	}
//
//	//선택삭제, 전체삭제
//	@Override
//	public int cartDeleteArray(ArrayList<CartVO> list) {
//		// TODO Auto-generated method stub
//		logger.info("cartDeleteArray() 진입: ");
//		return sqlSession.update("cartDeleteArray", list);
//	}
//
//	//장바구니 목록 선택해서 가져오기, S, 리스트데이터 들고와서 리스트로 가져오기
//	@Override
//	public List<CartVO> cartSelect(ArrayList<CartVO> list) {
//		// TODO Auto-generated method stub
//		logger.info("cartSelect() 진입: ");
//		return sqlSession.selectList("cartSelect", list);
//	}

}
