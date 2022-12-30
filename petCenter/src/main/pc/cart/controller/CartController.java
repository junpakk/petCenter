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
		
		cvo.setCnum(cnum);
		cvo.setMnum("M0001");
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
		return "#";
	}
	
	
	@GetMapping("/cartSelectAll")
	public String cartSelectAll(CartVO cvo, Model model) {
		logger.info("cartSelectAll() 진입: ");
		logger.info("cvo.getMnum(): "+ cvo.getMnum());
		
		String mnum = cvo.getMnum();

		List<CartVO> listAll = cartService.cartSelectAll(mnum);
		if(listAll.size() > 0) {
			logger.info("listAll.size(): "+ listAll.size());
			model.addAttribute("listAll", listAll);
			return "cart/cartSelectAll";
		}
 		return "cart/cartSelectAll";
	}
	
//	@GetMapping("/cartInsert2")
//	public String cartInsert() {
//		logger.info("cartInsert() 진입: ");
//		
//		
//		
//		return "cart/cartInsert";
//	}
	
	
	
	//장바구니 정보 세션처리
//	@RequestMapping(value="cartProcess", method=RequestMethod.GET)
//	public String cartProcess(Model model, ProductVO pvo) {
//		logger.info("kioskCartProcess.pjb 진입: ");
//		
//		String name = pvo.getPname();
//		String price = pvo.getPprice();
////		String photo = pvo.getPphoto();
//		logger.info("name: "+ name);
//		logger.info("price: "+ price);
////		logger.info("photo: "+ photo);
//		
//		return "cart/cartProcess";
//	}

}
