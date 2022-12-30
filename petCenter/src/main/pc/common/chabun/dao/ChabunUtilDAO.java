package main.pc.common.chabun.dao;

import main.pc.cart.vo.CartVO;
import main.pc.community.vo.CommunityVO;
import main.pc.fair.vo.FairVO;
import main.pc.like.vo.LikeVO;
import main.pc.map.vo.MapVO;
import main.pc.reply.vo.ReplyVO;
import main.pc.zang.vo.ZangVO;
import main.pc.member.vo.MemberVO;
import main.pc.product.vo.ProductVO;

public interface ChabunUtilDAO {

	public MemberVO getChabunMember();
	public ProductVO getProductChabun();//상품
	public CartVO getCartChabun();// 카트
	public ReplyVO getReplyChabun();
	public LikeVO getLikeChabun();
	
	public FairVO getFairChabun();
	public MapVO getMapChabun();//맵
	
	public ZangVO getZangChabun();

	public CommunityVO getCommunityChabun();


}
