package main.pc.reply.dao;

import java.util.List;

import main.pc.reply.vo.ReplyVO;

public interface ReplyDAO {

	public int replyInsert(ReplyVO rvo);

	public List<ReplyVO> replySelectAll(ReplyVO rvo);

	public int replyDelete(ReplyVO rvo);

}
