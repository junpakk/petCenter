package main.pc.cart.dao;

import java.util.ArrayList;
import java.util.List;

import main.pc.cart.vo.CartVO;

public interface CartDAO {

	public int cartInsert(CartVO cvo);//장바구니, I
	public List<CartVO> cartSelectAll(CartVO cvo);//회원별 장바구니 S
	public int cartDelete(CartVO cvo);//한건 클릭 삭제
	public List<CartVO> cartSelect(ArrayList<CartVO> list);//장바구니 목록 선텍해서 가져오기, S
	public int cartDeleteArray(ArrayList<CartVO> listDel);//장바구니 선택삭제, 전체삭제

//	public List<CartVO> cartSelectAll(CartVO cvo);//장바구니, S
}
