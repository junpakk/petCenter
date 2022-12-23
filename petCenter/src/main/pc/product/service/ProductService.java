package main.pc.product.service;

import java.util.List;

import main.pc.product.vo.ProductVO;

public interface ProductService {

	int productInsert(ProductVO pvo);//상품등록
	List<ProductVO> productSelectAll(ProductVO pvo);//상품전체조회
	List<ProductVO> productSelect(ProductVO pvo);//상품조회

}
