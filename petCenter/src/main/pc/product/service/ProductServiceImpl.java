package main.pc.product.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.product.dao.ProductDAO;
import main.pc.product.vo.ProductVO;


@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	Logger logger = LogManager.getLogger(ProductServiceImpl.class);
	
	//서비스에서 DAO 연결, DI(의존성주입)
	@Autowired(required=false)
	private ProductDAO productDAO;

	@Override
	public int productInsert(ProductVO pvo) {
		// TODO Auto-generated method stub
		logger.info("productInsert() 진입: ");
		return productDAO.productInsert(pvo);
	}

	//상품 전체조회, S
	@Override
	public List<ProductVO> productSelectAll(ProductVO pvo) {
		// TODO Auto-generated method stub
		logger.info("productSelectAll() 진입: ");
		return productDAO.productSelectAll(pvo);
	}

	//상품조회, S
	@Override
	public List<ProductVO> productSelect(ProductVO pvo) {
		// TODO Auto-generated method stub
		logger.info("productSelect() 진입: ");
		return productDAO.productSelect(pvo);
	}

}
