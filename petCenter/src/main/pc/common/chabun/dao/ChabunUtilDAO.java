package main.pc.common.chabun.dao;

import main.pc.like.vo.LikeVO;
import main.pc.reply.vo.ReplyVO;
import main.pc.member.vo.MemberVO;
import main.pc.product.vo.ProductVO;

public interface ChabunUtilDAO {

	public MemberVO getChabunMember();
	public ProductVO getProductChabun();//상품
	public ReplyVO getReplyChabun();
	public LikeVO getLikeChabun();


}
