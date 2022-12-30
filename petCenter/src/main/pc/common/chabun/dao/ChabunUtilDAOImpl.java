package main.pc.common.chabun.dao;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.pc.fair.vo.FairVO;
import main.pc.like.vo.LikeVO;
import main.pc.map.vo.MapVO;
import main.pc.reply.vo.ReplyVO;
import main.pc.zang.vo.ZangVO;
import main.pc.member.vo.MemberVO;
import main.pc.product.vo.ProductVO;
import main.pc.cart.vo.CartVO;
import main.pc.community.vo.CommunityVO;

@Repository
public class ChabunUtilDAOImpl implements ChabunUtilDAO {
	Logger logger = LogManager.getLogger(ChabunUtilDAOImpl.class);

	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberVO getChabunMember() {
		// TODO Auto-generated method stub
		logger.info("getChabunMember() 함수 진입 >>> : ");
		return sqlSession.selectOne("getChabunMember");
	}

	//상품
	@Override
	public ProductVO getProductChabun() {
		// TODO Auto-generated method stub
		logger.info("getProductChabun() 함수 진입 >>> : ");
		return sqlSession.selectOne("getProductChabun");

	}
	@Override
	public ReplyVO getReplyChabun() {
		// TODO Auto-generated method stub
		logger.info("getReplyChabun 함수 진입");
		
		return sqlSession.selectOne("getReplyChabun");
	
	}

	@Override
	public LikeVO getLikeChabun() {
		// TODO Auto-generated method stub
		logger.info("getLikeChabun 함수 진입");
		
		return sqlSession.selectOne("getLikeChabun");

	}

	//카트
	@Override
	public CartVO getCartChabun() {
		// TODO Auto-generated method stub
		logger.info("getCartChabun 함수 진입: ");
		return sqlSession.selectOne("getCartChabun");
	}
	@Override
	public FairVO getFairChabun() {
		// TODO Auto-generated method stub
		logger.info("getFairChabun 함수 진입");
		
		return sqlSession.selectOne("getFairChabun");
	}
	
	@Override
	public MapVO getMapChabun() {
		// TODO Auto-generated method stub
		logger.info("getMapChabun 함수 진입");
		
		return sqlSession.selectOne("getMapChabun");
	}	
	
	@Override
	public ZangVO getZangChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getZangChabun");
	}
	@Override
	public CommunityVO getCommunityChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getCommunityChabun");
	}
}