package main.pc.common.chabun.service;

import main.pc.member.vo.MemberVO;
import main.pc.notice.vo.NoticeVO;
import main.pc.order.vo.OrderVO;
import main.pc.photo.vo.PhotoVO;
import main.pc.product.vo.ProductVO;
import main.pc.cart.vo.CartVO;
import main.pc.communities.vo.CommunitiesVO;
import main.pc.fair.vo.FairVO;
import main.pc.like.vo.LikeVO;
import main.pc.map.vo.MapVO;
import main.pc.reply.vo.ReplyVO;


public interface ChabunUtilService {

	public ReplyVO getReplyChabun();//댓글
	public LikeVO getLikeChabun();//좋아요
	public MemberVO getChabunMember();//회원
	public ProductVO getProductChabun();//상품
	public CartVO getCartChabun();//카트
	public OrderVO getOrderChabun();//오더
	public FairVO getFairChabun();//박람회
	public MapVO getMapChabun();//맵
	public CommunitiesVO getCommunitiesChabun();
	public NoticeVO getNoticeChabun();//공지사항
	public PhotoVO getPhotoChabun();//공지사항
	
	
}
