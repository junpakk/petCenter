package main.pc.order.dao;

import java.util.List;
import main.pc.order.vo.OrderVO;

public interface OrderDAO {

	int orderInsert(List<OrderVO> listOrder);//오더, I
	List<OrderVO> orderSelectAll(OrderVO ovo);//오더 목록조회

}
