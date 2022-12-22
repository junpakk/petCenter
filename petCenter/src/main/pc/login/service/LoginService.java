package main.pc.login.service;

import java.util.List;

import main.pc.member.vo.MemberVO;

public interface LoginService {

	public List<MemberVO> loginCheck(MemberVO mvo);
}
