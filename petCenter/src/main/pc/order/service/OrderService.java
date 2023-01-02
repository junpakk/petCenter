package main.pc.order.service;

import java.util.List;
import main.pc.order.vo.OrderVO;

public interface OrderService {

	int orderInsert(List<OrderVO> listOrder);//오더,I
	List<OrderVO> orderSelectAll(OrderVO ovo);//오더 목록보기
	
}
