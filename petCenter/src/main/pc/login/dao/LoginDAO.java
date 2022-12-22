package main.pc.login.dao;

import java.util.List;

import main.pc.member.vo.MemberVO;

public interface LoginDAO {

	public List<MemberVO> loginCheck(MemberVO mvo);
}
