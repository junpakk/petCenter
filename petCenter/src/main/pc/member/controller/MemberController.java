package main.pc.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import main.pc.common.ChabunUtil;
import main.pc.common.CommonUtils;
import main.pc.common.chabun.service.ChabunUtilService;
import main.pc.member.service.MemberService;
import main.pc.member.vo.MemberVO;


@Controller
public class MemberController {
	Logger logger = LogManager.getLogger(MemberController.class);
	
	// 컨트롤러에서 서비스 필드 오토 와이어드
	@Autowired(required=false)
	private MemberService memberService;
	
	// 컨트롤러에서 채번 서비스 필드 오토 와이어드
	@Autowired(required=false)
	private ChabunUtilService chabunUtilService;
	
	//인서트 폼 호출하기
	@GetMapping("memInsertForm")
	public String memInsertForm() {
		logger.info("memInsertForm 함수 진입 >>> :");
		return "member/memInsertForm";
	}
	
	//인서트 DB 입력
	@PostMapping("memInsert")
	public String memInsert(HttpServletRequest req, MemberVO mvo, Model model) {
		logger.info("memInsert 함수 진입 >>> :");
		
		String mnum = ChabunUtil.getMemberChabun("D", chabunUtilService.getChabunMember().getMnum());
		logger.info("memInsert mnum >>> : " + mnum);
		
		// 회원번호
		mvo.setMnum(mnum);
		// 이름
		// 아이디
		// 비밀번호
		// 휴대폰
		String mhp1 = req.getParameter("mhp1");
		String mhp2 = req.getParameter("mhp2");
		String mhp3 = req.getParameter("mhp3");
		String mhp = mhp1.concat("-").concat(mhp2).concat("-").concat(mhp3);
		mvo.setMhp(mhp);
		// 이메일
		String memail1 = req.getParameter("memail1");
		String memail2 = req.getParameter("memail2");
		String memail = memail1.concat("@").concat(memail2);
		mvo.setMemail(memail);
		// 기호동물
		String[] mpetArr = req.getParameterValues("mpetArr");
		String mpet = String.join(",", mpetArr);
		mvo.setMpet(mpet);
		// 자기소개
		
		int iCnt = memberService.memInsert(mvo);
		if (iCnt > 0) {
			logger.info("memInsert iCnt >>> : " + iCnt);
			model.addAttribute("cnt", iCnt);
			model.addAttribute("result", "입력");
			return "member/memResult";
		}
		return "member/memError";
	}
	
	@GetMapping("memSelectAll")
	public String memSelectAll(MemberVO mvo, Model model) {
		logger.info("memSelectAll 함수 진입 >>> :");
		
		// 페이징 처리
		int pageSize = CommonUtils.MEM_PAGE_SIZE;
		int groupSize = CommonUtils.MEM_GROUP_SIZE;
		int curPage = CommonUtils.MEM_CUR_PAGE;
		int totalCount = CommonUtils.MEM_TOTAL_COUNT;
		
		if(mvo.getCurPage() != null) {
			curPage = Integer.parseInt(mvo.getCurPage());
		}
		
		mvo.setPageSize(String.valueOf(pageSize));
		mvo.setGroupSize(String.valueOf(groupSize));
		mvo.setCurPage(String.valueOf(curPage));
		mvo.setTotalCount(String.valueOf(totalCount));
		
		logger.info("mvo.getPageSize() >>> : " + mvo.getPageSize());
		logger.info("mvo.getGroupSize() >>> : " + mvo.getGroupSize());
		logger.info("mvo.getCurPage() >>> : " + mvo.getCurPage());
		logger.info("mvo.getTotalCount() >>> : " + mvo.getTotalCount());
		
		logger.info("mvo.getSearchFilter() >>> : " + mvo.getSearchFilter());
		logger.info("mvo.getKeyword() >>> : " + mvo.getKeyword());
//		logger.info("mvo.getStartDate() >>> : " + mvo.getStartDate());
//		logger.info("mvo.getEndDate() >>> : " + mvo.getEndDate());
		
		//셀렉트올 값을 listAll 에 담음
		List<MemberVO> listAll = memberService.memSelectAll(mvo);
		int nCnt = listAll.size();
		
		// 리스트의 사이즈가 0보다 클때 데이터를 담아 jsp로 이동
		if(nCnt > 0) {
			logger.info("khgMemberSelectAll nCnt >>> : " + nCnt);
			
			model.addAttribute("searchMVO", mvo);
			model.addAttribute("listAll", listAll);
			
			return "member/memSelectAll";
		}
		logger.info("memSelectAll fail");
		return "member/memError";
	}
	
	@PostMapping("memSelect")
	public String memSelect(MemberVO mvo, Model model) {
		logger.info("memSelect 함수 진입 >>> :");
		
		List<MemberVO> list = memberService.memSelect(mvo);
		int nCnt = list.size();
		
		// 리스트의 사이즈가 1일때 데이터를 담아 jsp로 이동
		if(nCnt == 1) {
			logger.info("memSelect nCnt >>> : " + nCnt);
			
			model.addAttribute("list", list);
			
			return "member/memSelectForm";
		}
		logger.info("memSelect fail");
		return "member/memError";
	}
	
	@PostMapping("memUpdate")
	public String memUpdate(HttpServletRequest req, MemberVO mvo, Model model) {
		logger.info("memUpdate 함수 진입 >>> :");
		
		// 휴대폰
		String mhp1 = req.getParameter("mhp1");
		String mhp2 = req.getParameter("mhp2");
		String mhp3 = req.getParameter("mhp3");
		String mhp = mhp1.concat("-").concat(mhp2).concat("-").concat(mhp3);
		mvo.setMhp(mhp);
		// 이메일
		String memail1 = req.getParameter("memail1");
		String memail2 = req.getParameter("memail2");
		String memail = memail1.concat("@").concat(memail2);
		mvo.setMemail(memail);
		// 기호동물
		String[] mpetArr = req.getParameterValues("mpetArr");
		String mpet = String.join(",", mpetArr);
		mvo.setMpet(mpet);
		// 자기소개
		
		int uCnt = memberService.memUpdate(mvo);
		if (uCnt > 0) {
			logger.info("memUpdate iCnt >>> : " + uCnt);
			model.addAttribute("cnt", uCnt);
			model.addAttribute("result", "수정");
			return "member/memResult";
		}
		
		logger.info("memUpdate fail");
		return "member/memError";
	}
	
	@PostMapping("memDelete")
	public String memDelete(MemberVO mvo, Model model) {
		logger.info("memDelete 함수 진입 >>> :");
		
		int dCnt = memberService.memDelete(mvo);
		if (dCnt > 0) {
			logger.info("memDelete iCnt >>> : " + dCnt);
			model.addAttribute("cnt", dCnt);
			model.addAttribute("result", "삭제");
			return "member/memResult";
		}
		
		logger.info("memDelete fail");
		return "member/memError";
	}
	
}
