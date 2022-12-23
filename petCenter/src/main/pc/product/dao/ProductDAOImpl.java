package main.pc.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.product.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	Logger logger = LogManager.getLogger(ProductDAOImpl.class);
	
	//마이바티스 쿼리 연결
	@Autowired(required=false)
	private SqlSession sqlSession;

	//상품등록
	@Override
	public int productInsert(ProductVO pvo) {
		// TODO Auto-generated method stub
		logger.info("productInsert() 진입: ");
		return (Integer)sqlSession.insert("productInsert", pvo);
	}

	//상품 전체조회, S
	@Override
	public List<ProductVO> productSelectAll(ProductVO pvo) {
		// TODO Auto-generated method stub
		logger.info("productSelectAll() 진입: ");
		return sqlSession.selectList("productSelectAll", pvo);
	}
	
//
//	//상품 선택 조회, S
//	@Override
//	public List<ProductVO> productSelect(ProductVO pvo) {
//		// TODO Auto-generated method stub
//		logger.info("productSelect() 진입: ");
//		return sqlSession.selectList("productSelect", pvo);
//	}

}
