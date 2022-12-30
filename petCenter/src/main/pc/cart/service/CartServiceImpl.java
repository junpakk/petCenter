package main.pc.cart.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.cart.dao.CartDAO;
import main.pc.cart.vo.CartVO;

@Service
@Transactional
public class CartServiceImpl implements CartService {
	Logger logger = LogManager.getLogger(CartServiceImpl.class);
	
	//서비스에서 DAO 연결하기
	//필드 @Autowired 어노테이션으로 DI(의존성 주입하기)
	@Autowired(required=false)
	private CartDAO cartDAO;

	@Override
	public int cartInsert(CartVO cvo) {
		// TODO Auto-generated method stub
		logger.info("cartInsert() 진입: ");
		return cartDAO.cartInsert(cvo);
	}

	@Override
	public List<CartVO> cartSelectAll(String mnum) {
		// TODO Auto-generated method stub
		logger.info("cartSelectAll() 진입: ");
		return cartDAO.cartSelectAll(mnum);
	}

//	@Override
//	public List<CartVO> cartSelectAll(CartVO cvo) {
//		// TODO Auto-generated method stub
//		logger.info("cartSelectAll() 진입: ");
//		return cartDAO.cartSelectAll(cvo);
//	}
//
//	//한건 클릭 삭제
//	@Override
//	public int cartDelete(CartVO cvo) {
//		// TODO Auto-generated method stub
//		logger.info("cartDelete() 진입: ");
//		return cartDAO.cartDelete(cvo);
//	}
//
//	@Override
//	public int cartDeleteArray(ArrayList<CartVO> list) {
//		// TODO Auto-generated method stub
//		logger.info("cartDeleteArray() 진입: ");
//		return cartDAO.cartDeleteArray(list);
//	}
//
//	//장바구니 목록 선태해서 가져오기, S
//	@Override
//	public List<CartVO> cartSelect(ArrayList<CartVO> list) {
//		// TODO Auto-generated method stub
//		logger.info("cartSelect() 진입: ");
//		return cartDAO.cartSelect(list);
//	}

}
