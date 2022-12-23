package main.pc.reply.service;

import java.util.List;

import main.pc.reply.vo.ReplyVO;

public interface ReplyService {

	public int replyInsert(ReplyVO rvo);

	public List<ReplyVO> replySelectAll(ReplyVO rvo);

	public int replyDelete(ReplyVO rvo);

}
