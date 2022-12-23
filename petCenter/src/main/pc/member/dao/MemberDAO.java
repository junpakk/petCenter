package main.pc.member.dao;

import java.util.List;

import main.pc.member.vo.MemberVO;

public interface MemberDAO {

	public int memInsert(MemberVO mvo);
	public List<MemberVO> memSelectAll(MemberVO mvo);
	public List<MemberVO > memSelect(MemberVO mvo);
	public List<MemberVO > memSelectForm(MemberVO mvo);
	public int memUpdate(MemberVO mvo);
	public int memDelete(MemberVO mvo);
	
	public List<MemberVO> memIdCheck(MemberVO mvo);
}
