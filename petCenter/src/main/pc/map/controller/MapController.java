package main.pc.map.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.pc.common.ChabunUtil;
import main.pc.common.CommonUtils;
import main.pc.common.chabun.service.ChabunUtilService;
import main.pc.map.service.MapService;
import main.pc.map.vo.MapVO;

@Controller
public class MapController {
	Logger logger = LogManager.getLogger(MapController.class);
	
	@Autowired(required=false)
	private MapService mapService;

	// 컨트롤러에서 채번 서비스 필드 오토 와이어드
	@Autowired(required=false)
	private ChabunUtilService chabunUtilService;	
	
	//테스트1 지도레벨테스트
	@GetMapping("mapTest1")
	public String mapTest1() {
		logger.info("mapTest1 함수 진입 >>> ");
		
		return "map/mapTest1";
	}
/*
	@GetMapping("kSearchAndList")
	public String kSearchAndList() {
		logger.info("kSearchAndList 함수 진입 >>> ");
		
		//return "map/kSearchAndList";
		return "map/coord2addr";
	}
*/	
	//테스트3 지도 위경도확인 테스트
	@GetMapping("marker")
	public String marker() {
		logger.info("marker 함수 진입 >>> ");
		
		return "map/marker";
	}	
	
	//동물병원찾기
	@GetMapping("keySearch")
	public String keySearch() {
		logger.info("keySearch 함수 진입 >>> ");
		
		return "map/keySearch";
	}

	@GetMapping("walkHelper")
	public String walkHelper() {
		logger.info("walkHelper 함수 진입 >>> ");
		
		return "map/walkHelper";
	}
	
	//산책로 조회 삭제
	@GetMapping("walkHistory")
	public String walkHistory() {
		logger.info("walkHistory 함수 진입 >>> ");
		
		return "map/walkHistory";
	}		

	@PostMapping("walkInsert")
	@ResponseBody
	public String walkInsert(MapVO mvo) {
		logger.info("walkInsert 함수 진입 >>> ");

		String msg = "INO";
		String mapnum = ChabunUtil.getMapChabun("D", chabunUtilService.getMapChabun().getMapnum());
		mvo.setMapnum(mapnum);
		logger.info(mvo.toString());
		
		int inCnt = mapService.walkInsert(mvo);
		if(inCnt > 0) {
			logger.info("inCnt >>> "+inCnt);
			msg = "IYES";
		}
		
		return msg;
	}
	
	@GetMapping("walkHisSrch")
	public String walkHisSrch(HttpServletRequest req, @ModelAttribute MapVO mvo, Model model) {
		logger.info("walkHisSrch 함수 진입 >>> ");
		
		int pageSize = CommonUtils.MAP_PAGE_SIZE;
		int groupSize = CommonUtils.MAP_GROUP_SIZE;
		int curPage = CommonUtils.MAP_CUR_PAGE;
		int totalCount = CommonUtils.MAP_TOTAL_COUNT;	
		
		if(mvo.getCurPage() != null) {
			curPage = Integer.parseInt(mvo.getCurPage());
		}		

		mvo.setPageSize(String.valueOf(pageSize));
		mvo.setGroupSize(String.valueOf(groupSize));
		mvo.setCurPage(String.valueOf(curPage));
		mvo.setTotalCount(String.valueOf(totalCount));		
		
		logger.info(mvo.toString());

		List<MapVO> mList = mapService.walkHisSrch(mvo);
		int nCnt = mList.size();
		
		if(nCnt > 0) {
			logger.info("mList.size() >>> "+nCnt);
			model.addAttribute("paging", mvo);
			model.addAttribute("mList", mList);
			return "map/walkHisSrch";
		}
		
		return "#";
		
	}
	
	@PostMapping("walkHisDel")
	@ResponseBody
	public String walkHisDel(MapVO mvo, Model model) {
		logger.info("walkHisDel 함수 진입 >>> ");
		
		logger.info(mvo.toString());
		
		String msg = "INO";
		int deleteCnt = mapService.walkHisDel(mvo);
		if(deleteCnt > 0) {
			logger.info("deleteCnt >>> "+deleteCnt);
			msg = "IYES";
		}
		
		return msg;	
	}
	
}
