package main.pc.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import main.pc.cart.service.CartService;
import main.pc.cart.vo.CartVO;
import main.pc.common.ChabunUtil;
import main.pc.common.chabun.service.ChabunUtilService;
import main.pc.product.vo.ProductVO;

@Controller
public class CartController {
	Logger logger = LogManager.getLogger(CartController.class);

	//컨트롤러에서 채번 서비스 연결
	@Autowired(required=false)
	private ChabunUtilService chabunUtilService;
	
	//서비스 연결
	@Autowired(required=false)
	private CartService cartService;
	
	
	//장바구니 넣기
	@RequestMapping(value="cartInsert", method=RequestMethod.GET)
	public String cartInsert(ProductVO pvo, CartVO cvo, HttpServletRequest req, Model model) {
		logger.info("cartInsert() 진입: ");
		
		//location.href="cartInsert.pc?pname=<%= pname %>&pprice=<%= pprice %>&pphoto=<%= pphoto %>&ccnt="+cCnt;	
		logger.info("pvo.toString(): "+ pvo.toString());
		logger.info("pvo.getPname(): "+ pvo.getPname());
		logger.info("pvo.getPprice(): "+ pvo.getPprice());
		logger.info("pvo.getPphoto(): "+ pvo.getPphoto());
		logger.info("ccnt: "+ req.getParameter("ccnt"));
		

		//채번
		String cnum = ChabunUtil.getCartChabun("D", chabunUtilService.getCartChabun().getCnum());
		logger.info("cnum: "+ cnum);
		String mnum = req.getParameter("mnum");
		logger.info("mnum: "+ mnum);
		
		cvo.setCnum(cnum);
		cvo.setMnum(mnum);
		cvo.setCname(pvo.getPname());
		cvo.setCprice(pvo.getPprice());
		cvo.setCphoto(pvo.getPphoto());
		cvo.setCcnt(req.getParameter("ccnt"));
		
		logger.info("cvo.toString(): "+ cvo.toString());
		
		//서비스 호출
		int nCnt = cartService.cartInsert(cvo);
		
		if(nCnt > 0) {
			logger.info("cartInsert nCnt: "+ nCnt);
			model.addAttribute("mnum", cvo.getMnum());
			return "cart/cartInsert";
		}
		return "product/productSelect";
	}
	
	
	@GetMapping("/cartSelectAll")
	public String cartSelectAll(CartVO cvo, Model model) {
		logger.info("cartSelectAll() 진입: ");
		logger.info("cvo.getMnum(): "+ cvo.getMnum());
		
		cvo.setMnum(cvo.getMnum());

		List<CartVO> listAll = cartService.cartSelectAll(cvo);
		if(listAll.size() > 0) {
			logger.info("listAll.size(): "+ listAll.size());
			model.addAttribute("listAll", listAll);
			return "cart/cartSelectAll";
		}
 		return "cart/cartSelectAll";
	}
	
	//한건 클릭 삭제
	@RequestMapping(value="cartDelete", method=RequestMethod.GET)
	public String cartDelete(CartVO cvo, HttpServletRequest req) {
		logger.info("cartDelete() 함수 진입: ");
		
		cvo.setCnum(req.getParameter("cnum"));
		cvo.setMnum(req.getParameter("mnum"));
		logger.info("cvo.getCnum(): "+ cvo.getCnum());
		logger.info("cvo.getMnum(): "+ cvo.getMnum());
		
		int nCnt = cartService.cartDelete(cvo);
		if(nCnt > 0) {
			logger.info("한건 클릭 삭제를 처리합니다, nCnt: "+ nCnt);
		}
		return "cart/cartDelete";
	}
}
