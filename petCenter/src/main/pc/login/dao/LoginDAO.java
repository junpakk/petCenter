package main.pc.login.dao;

import java.util.List;

import main.pc.login.vo.TempAuthVO;
import main.pc.member.vo.MemberVO;

public interface LoginDAO {

	public List<MemberVO> loginCheck(MemberVO mvo);
	
	public List<MemberVO> emailCntCheck(MemberVO mvo);
	public int tempAuthInsert(TempAuthVO avo);
	public List<MemberVO> idFind(MemberVO mvo);
	public List<MemberVO> idFindAuthnum(MemberVO mvo);
}
