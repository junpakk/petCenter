package main.pc.member.service;

import java.util.List;

import main.pc.member.vo.MemberVO;

public interface MemberService {

	public int memInsert(MemberVO mvo);
	public List<MemberVO> memSelectAll(MemberVO mvo);
	public List<MemberVO > memSelect(MemberVO mvo);
	public List<MemberVO > memSelectForm(MemberVO mvo);
	public int memupdate(MemberVO mvo);
	public int memDelete(MemberVO mvo);
}
