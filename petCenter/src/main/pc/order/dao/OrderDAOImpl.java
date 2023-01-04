package main.pc.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.order.vo.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	Logger logger = LogManager.getLogger(OrderDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;

	//오더, I
	@Override
	public int orderInsert(List<OrderVO> listOrder) {
		// TODO Auto-generated method stub
		logger.info("orderInsert() 진입: ");
		return (Integer)sqlSession.insert("orderInsert", listOrder);
	}

	@Override
	public List<OrderVO> orderSelectAll(OrderVO ovo) {
		// TODO Auto-generated method stub
		logger.info("orderSelectAll() 진입: ");
		return sqlSession.selectList("orderSelectAll", ovo);
	}
}
