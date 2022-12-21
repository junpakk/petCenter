package main.pc.map.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MapController {
	Logger logger = LogManager.getLogger(MapController.class);
	
	@GetMapping("mapTest1")
	public String mapTest1() {
		logger.info("mapTest1 함수 진입 >>> ");
		
		return "map/mapTest1";
	}

	@GetMapping("kSearchAndList")
	public String kSearchAndList() {
		logger.info("kSearchAndList 함수 진입 >>> ");
		
		//return "map/kSearchAndList";
		return "map/coord2addr";
	}
	
	@GetMapping("marker")
	public String marker() {
		logger.info("marker 함수 진입 >>> ");
		
		return "map/marker";
	}	
	
	@GetMapping("keySearch")
	public String keySearch() {
		logger.info("keySearch 함수 진입 >>> ");
		
		return "map/keySearch";
	}	

}
