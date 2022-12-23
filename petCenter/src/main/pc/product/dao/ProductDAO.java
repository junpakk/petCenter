package main.pc.product.dao;

import java.util.List;

import main.pc.product.vo.ProductVO;

public interface ProductDAO {

	int productInsert(ProductVO pvo);//상품등록
	List<ProductVO> productSelectAll(ProductVO pvo);//상품 전체조회, S
//
//	List<ProductVO> productSelect(ProductVO pvo);//상품 선택조회, S

}
