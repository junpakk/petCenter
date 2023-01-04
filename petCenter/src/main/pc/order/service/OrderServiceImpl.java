package main.pc.order.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.order.dao.OrderDAO;
import main.pc.order.vo.OrderVO;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
	Logger logger = LogManager.getLogger(OrderServiceImpl.class);
	
	//서비스에서 DAO 연결하기
	//필드 @Autowired 어노테이션으로 DI(의존성 주입하기)
	@Autowired(required=false)
	private OrderDAO orderDAO;

	//오더, I
	@Override
	public int orderInsert(List<OrderVO> listOrder) {
		// TODO Auto-generated method stub
		logger.info("orderInsert() 진입: ");
		return orderDAO.orderInsert(listOrder);
	}

	//오더 목록 조회
	@Override
	public List<OrderVO> orderSelectAll(OrderVO ovo) {
		// TODO Auto-generated method stub
		logger.info("orderSelectAll() 진입: ");
		return orderDAO.orderSelectAll(ovo);
	}

}
