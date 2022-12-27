package main.pc.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import main.pc.common.ChabunUtil;
import main.pc.common.CommonUtils;
import main.pc.common.FileUploadUtil;
import main.pc.common.chabun.service.ChabunUtilService;
import main.pc.product.service.ProductService;
import main.pc.product.vo.ProductVO;

@Controller
public class ProductController {
	Logger logger = LogManager.getLogger(ProductController.class);
	
	//채번서비스 DI
	@Autowired(required=false)
	private ChabunUtilService chabunUtilService;
	
	//상품서비스 DI
	@Autowired(required=false)
	private ProductService productService;
	
	//상품 등록폼
	@RequestMapping(value="productInsertForm", method=RequestMethod.GET)
	public String productInsertForm() {
		logger.info("productInsertForm() 진입: ");
		return "product/productInsertForm";
	}
	
	//상품 등록
	@RequestMapping(value="productInsert", method=RequestMethod.POST)
	public String productInsert(HttpServletRequest req) {
		logger.info("productInsert() 진입: ");
		
		//채번
		String pnum = ChabunUtil.getProductChabun("D", chabunUtilService.getProductChabun().getPnum());
		logger.info("pnum: "+ pnum);
		
		//이미지 업로드, 이미지 사이즈 새로 만들어서 수정해야할수도 있음
		FileUploadUtil fu = new FileUploadUtil(  CommonUtils.PRODUCT_IMG_UPLOAD_PATH
												,CommonUtils.PRODUCT_IMG_FILE_SIZE
												,CommonUtils.PRODUCT_EN_CODE);
				
		//이미지 파일 원본 사이즈
		boolean bool = fu.imgfileUpload(req);
		logger.info("productInsert bool: "+ bool);
		
		//넘어온 데이터 FileUploadUtil로 바이너리형태를 넘길 수 있게끔 바꿔서 pvo에 초기화
		ProductVO pvo = null;
		pvo = new ProductVO();
		
		pvo.setPnum(pnum);
		pvo.setPname(fu.getParameter("pname"));
		pvo.setPprice(fu.getParameter("pprice"));
		//카테고리 생각, 대분류(1강아지,2고양이)/중분류(1사료2간식3용품)
		String pcategory = fu.getParameter("pcategory1").concat(fu.getParameter("pcategory2"));
		pvo.setPcategory(pcategory);
		pvo.setPdetail(fu.getParameter("pdetail"));
		pvo.setPphoto(fu.getFileName("pphoto"));
		logger.info("toString: "+ pvo.toString());
		//서비스 호출
		int nCnt = productService.productInsert(pvo);
		logger.info("productInsert nCnt: "+ nCnt);
		if(nCnt > 0) {
			return "product/productInsertForm";
		}
		return "product/productInsertForm";
	}//end of productInsert
	
	//상품 전체목록 조회
	@RequestMapping(value="productSelectAll", method=RequestMethod.GET)
	public String productSelectAll(ProductVO pvo, Model model) {
		logger.info("productSelectAll() 진입: ");
		
//		//페이지처리
//		int pageSize = CommonUtils.PRODUCT_PAGE_SIZE;
//		int groupSize = CommonUtils.PRODUCT_GROUP_SIZE;
//		int curPage = CommonUtils.PRODUCT_CUR_PAGE;
//		int totalCount = CommonUtils.PRODUCT_TOTAL_COUNT;
//		
//		if(pvo.getCurPage() != null) {
//			curPage = Integer.parseInt(pvo.getCurPage());
//		}
//		
//		pvo.setPageSize(String.valueOf(pageSize));
//		pvo.setGroupSize(String.valueOf(groupSize));
//		pvo.setCurPage(String.valueOf(curPage));
//		pvo.setTotalCount(String.valueOf(totalCount));
//		
//		logger.info("productSelectAll pvo.getPageSize() : " + pvo.getPageSize());
//		logger.info("productSelectAll pvo.getGroupSize() : " + pvo.getGroupSize());
//		logger.info("productSelectAll pvo.getCurPage() : " + pvo.getCurPage());
//		logger.info("productSelectAll pvo.getTotalCount() : " + pvo.getTotalCount());
		
		//서비스 호출
		List<ProductVO> listAll = productService.productSelectAll(pvo);
		if(listAll.size() > 0) {
			logger.info("listAll.size(): "+ listAll.size());
			
//			model.addAttribute("pagingPVO", pvo);//페이징 정보
			model.addAttribute("listAll", listAll);//상품 정보
			return "product/productSelectAll";
		}
		return "index";
	}//end of productSelectAll
	
	//상품 조회
	@RequestMapping(value="productSelect", method=RequestMethod.GET)
	public String productSelect(ProductVO pvo, Model model) {
		logger.info("productSelect() 진입: ");
		
		//상품번호 확인하기
		logger.info("pvo.getPnum(): "+ pvo.getPnum());
		logger.info("pvo.toString(): "+ pvo.toString());
		
		//서비스 호출
		List<ProductVO> list = productService.productSelect(pvo);
		if(list.size() > 0) {
			logger.info("list.size(): "+ list.size());
			model.addAttribute("list", list);
			return "product/productSelect";
		}
		return "product/productSelectAll";
	}

}
