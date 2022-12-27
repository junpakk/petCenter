package main.pc.common.chabun.service;

import main.pc.member.vo.MemberVO;
import main.pc.product.vo.ProductVO;

import main.pc.fair.vo.FairVO;
import main.pc.like.vo.LikeVO;
import main.pc.reply.vo.ReplyVO;

public interface ChabunUtilService {

	public ReplyVO getReplyChabun();//댓글
	public LikeVO getLikeChabun();//좋아요
	public MemberVO getChabunMember();//회원
	public ProductVO getProductChabun();//상품
	public FairVO getFairChabun();//박람회



}
