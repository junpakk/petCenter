package main.pc.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import main.pc.cart.service.CartService;
import main.pc.cart.vo.CartVO;
import main.pc.common.ChabunUtil;
import main.pc.common.chabun.service.ChabunUtilService;
import main.pc.order.service.OrderService;
import main.pc.order.vo.OrderVO;
import main.pc.product.service.ProductService;
import main.pc.product.vo.ProductVO;

@Controller
public class OrderController {
	Logger logger = LogManager.getLogger(OrderController.class);
	
	//컨트롤러에서 채번 서비스 연결
	@Autowired(required=false)
	private ChabunUtilService chabunUtilService;
	
	//서비스 DI, 오더
	@Autowired(required=false)
	private OrderService orderService;
	
	//서비스 DI, 장바구니
	@Autowired(required=false)
	private CartService cartService;
	
	//서비스 DI, 장바구니
	@Autowired(required=false)
	private ProductService productService;
	
	
	//오더 입력 폼
	@RequestMapping(value="orderInsertForm", method=RequestMethod.GET)
	public String orderInsertForm(HttpServletRequest req, Model model) {
		logger.info("orderInsertForm() 진입: ");
		
		//단건이 아니니까 배열로 cnum의 값을 받아주면 좋을 것 같다.
		String cnum[] = req.getParameterValues("cnum");
		String mnum = req.getParameter("mnum");
		for(int i=0; i<cnum.length; i++) {
			logger.info("cnum: "+ cnum[i]);
		}
		
		//우선 Cart에서 넘어온 데이터 정리해주기
		ArrayList<CartVO> list = new ArrayList<CartVO>();
		
		//장바구니에서 넘길 상품건수만큼 for문
		for(int i=0; i<cnum.length; i++) {
			CartVO cvo = new CartVO();
			cvo.setCnum(cnum[i]);
			cvo.setMnum(mnum);
			list.add(cvo);
			logger.info("list"+ list);
		}//end of for
		
		//장바구니에서 선택한 목록만 가져올 수 있게끔 cartSelect 쿼리문 새로 만들기
		List<CartVO> listAll = cartService.cartSelect(list);
		if(listAll.size() > 0) {
			logger.info("listAll.size(): "+ listAll.size());
			
			model.addAttribute("listAll", listAll);
			return "order/orderInsertForm";
		}
		return "order/cartSelectAll";
	}//end of orderInsertForm
	
	//오더 인서트
	@RequestMapping(value="orderInsert", method=RequestMethod.GET)
	public String orderInsert(HttpServletRequest req, Model model) {
		logger.info("orderInsert() 진입: ");
		
		//단건이 아니니까 배열로 cnum의 값을 받아주면 좋을 것 같다.
		String cnum[] = req.getParameterValues("cnum");
		String mnum = req.getParameter("mnum");
		int opsum = 0;
		
		for(int i=0; i<cnum.length; i++) {
			logger.info("cnum: "+ cnum[i]);
			logger.info("mnum: "+ mnum);
		}
		
		ArrayList<CartVO> list = new ArrayList<CartVO>();
		
		//장바구니에서 넘길 상품건수만큼 for문
		for(int i=0; i<cnum.length; i++) {
			CartVO cvo = new CartVO();
			cvo.setMnum(mnum);
			cvo.setCnum(cnum[i]);
			list.add(cvo);
		}//end of for
		
		//채번
		String onum = ChabunUtil.getOrderChabun("D", chabunUtilService.getOrderChabun().getOnum());
		logger.info("onum: "+ onum);
		
		//카트에서 선택한 목록만 가져와서 초기화 함
		List<CartVO> listCart = cartService.cartSelect(list);
	
		//아래에서 초기화한 VO 데이터 List OrderVO로 받을 예정
		List<OrderVO> listOrder = new ArrayList<OrderVO>();
		//for문 반복
		for(int i=0; i<listCart.size(); i++) {
			logger.info("listCart.size(): "+ listCart.size());
			OrderVO ovo = new OrderVO();//오더 VO 객체 생성
			CartVO ocvo = listCart.get(i);//카트 VO에 각 리스트 초기화
			opsum = Integer.parseInt(ocvo.getCcnt())*Integer.parseInt(ocvo.getCprice());
			
			//onum = "O20230101"
			String onum_front = onum.substring(0,9);
			//나머지 부분을 int로 형변환 "0001" -> 1
			String onum_end = onum.substring(9);
			onum_end = Integer.toString(Integer.parseInt(onum_end)+i);
			onum = onum_front + onum_end;
			
			//오더 VO에 데이터 싹 다 초기화
			ovo.setOnum(onum);
			ovo.setMnum(ocvo.getMnum());
			ovo.setCnum(ocvo.getCnum());
			ovo.setOname(ocvo.getCname());
			ovo.setOcnt(ocvo.getCcnt());
			ovo.setOpsum(Integer.toString(opsum));
			
			//주문자명
			String mname = req.getParameter("mname");
			logger.info("mname: "+ mname);
			ovo.setMname(mname);
			//연락처
			String mhp = req.getParameter("mhp").concat("-").concat(req.getParameter("mhp1")).concat("-").concat(req.getParameter("mhp2"));		
			logger.info("mhp: "+ mhp);
			ovo.setMhp(mhp);
			//우편번호
			String ozcode = req.getParameter("ozonecode");
			logger.info("ozcode: "+ ozcode);
			ovo.setOzcode(ozcode);
			//도로명주소
			String oraddress = req.getParameter("oroadaddress");
			logger.info("oraddress: "+ oraddress);
			ovo.setOraddress(oraddress);
			//도로명상세주소
			String oraddressd = req.getParameter("oroadaddressdetail");
			logger.info("oraddressd: "+ oraddressd);
			ovo.setOraddressd(oraddressd);
			//지번주소
			String ojibun = req.getParameter("ojibunaddress");
			logger.info("ojibun: "+ ojibun);
			ovo.setOjibun(ojibun);
			
			logger.info("ovo: "+ ovo);
			listOrder.add(ovo);
			logger.info("listOrder: "+ listOrder);
		}//end of for


		//오더 정보 DB에 저장하기
		int nCnt = orderService.orderInsert(listOrder);
		logger.info("nCnt: "+ nCnt);
		
		//오더가 완료됬으면 장바구니 데이터 제거 Y->N
		if(nCnt == -1) {
			logger.info("nCnt: "+ nCnt);
			
			ArrayList<CartVO> listDel = new ArrayList<CartVO>();
			
			for(int i=0; i<cnum.length; i++) {
				CartVO cvo = new CartVO();
				cvo.setCnum(cnum[i]);
				listDel.add(cvo);
			}
			
			int Cnt = cartService.cartDeleteArray(listDel);
			if(Cnt == -1) {
				logger.info("nCnt: "+ nCnt);
				
				return "cart/cartDelete";
			}
			return "";
		}
		return "cart/cartSelectAll";
	}//end of orderInsert
	
	//오더 목록 확인
	//장바구니 목록
	@RequestMapping(value="orderSelectAll", method=RequestMethod.GET)
	public String orderSelectAll(OrderVO ovo, HttpServletRequest req, Model model) {
		logger.info("orderSelectAll() 진입: ");
		
		String mnum ="";
		mnum = req.getParameter("mnum");
		ovo.setMnum(mnum);
		logger.info("ovo: "+ ovo);
		
		//서비스 호출
		List<OrderVO> orderListAll = orderService.orderSelectAll(ovo);
		if(orderListAll.size() > 0) {
			logger.info("orderListAll.size(): "+ orderListAll.size());
			model.addAttribute("orderListAll", orderListAll);
			logger.info("주문 전체 목록을 호출합니다.");
			return "order/orderSelectAll";
		}
		return "cart/cartSelectAll";
	}
}
