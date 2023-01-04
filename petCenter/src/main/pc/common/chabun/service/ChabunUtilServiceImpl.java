package main.pc.common.chabun.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.pc.cart.vo.CartVO;
import main.pc.common.chabun.dao.ChabunUtilDAO;
import main.pc.communities.vo.CommunitiesVO;
import main.pc.community.vo.CommunityVO;
import main.pc.fair.vo.FairVO;
import main.pc.like.vo.LikeVO;
import main.pc.map.vo.MapVO;
import main.pc.reply.vo.ReplyVO;

import main.pc.member.vo.MemberVO;
import main.pc.notice.vo.NoticeVO;
import main.pc.order.vo.OrderVO;
import main.pc.product.vo.ProductVO;

@Service
@Transactional
public class ChabunUtilServiceImpl implements ChabunUtilService {
	Logger logger = LogManager.getLogger(ChabunUtilServiceImpl.class);
	
	@Autowired(required=false)
	private ChabunUtilDAO chabunUtilDAO;
	
	// 댓글
	@Override
	public ReplyVO getReplyChabun() {
		// TODO Auto-generated method stub
		logger.info("getReplyChabun 함수 진입 : ");
		return chabunUtilDAO.getReplyChabun();
	}
	//좋아요
	@Override
	public LikeVO getLikeChabun() {
		// TODO Auto-generated method stub
		logger.info("getLikeChabun 함수 진입 : ");
		return chabunUtilDAO.getLikeChabun();
		
	}
	//회원
	@Override
	public MemberVO getChabunMember() {
		// TODO Auto-generated method stub
		logger.info("getChabunMember() 함수 진입 >>> : ");
		return chabunUtilDAO.getChabunMember();
	}

	//상품
	@Override
	public ProductVO getProductChabun() {
		// TODO Auto-generated method stub
		logger.info("getProductChabun() 함수 진입: ");
		return chabunUtilDAO.getProductChabun();

	}
	//카트
	@Override
	public CartVO getCartChabun() {
		// TODO Auto-generated method stub
		logger.info("getCartChabun() 함수 진입: ");
		return chabunUtilDAO.getCartChabun();
	}
	//오더
	@Override
	public OrderVO getOrderChabun() {
		// TODO Auto-generated method stub
		logger.info("getOrderChabun() 함수 진입: ");
		return chabunUtilDAO.getOrderChabun();
	}
	
	// 박람회
	@Override
	public FairVO getFairChabun() {
		// TODO Auto-generated method stub
		logger.info("getFairChabun() 함수 진입: ");
		return chabunUtilDAO.getFairChabun();
	}

	@Override
	public MapVO getMapChabun() {
		logger.info("getMapChabun() 함수 진입: ");
		return chabunUtilDAO.getMapChabun();
	}

	@Override
	public CommunityVO getCommunityChabun() {
		// TODO Auto-generated method stub
		return chabunUtilDAO.getCommunityChabun();
	}
	@Override
	public CommunitiesVO getCommunitiesChabun() {
		// TODO Auto-generated method stub
		return chabunUtilDAO.getCommunitiesChabun();
	}
	// 공지사항
	@Override
	public NoticeVO getNoticeChabun() {
		// TODO Auto-generated method stub
		logger.info("getNoticeChabun 함수 진입");
		return chabunUtilDAO.getNoticeChabun();
	}

	
}
