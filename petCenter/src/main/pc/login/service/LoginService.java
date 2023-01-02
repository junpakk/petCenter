package main.pc.login.service;

import java.util.List;

import main.pc.login.vo.IdFindVO;
import main.pc.login.vo.PwFindVO;
import main.pc.member.vo.MemberVO;

public interface LoginService {

	public List<MemberVO> loginCheck(MemberVO mvo);
	
	public List<MemberVO> emailCntCheck(MemberVO mvo);
	public int tempAuthInsert(IdFindVO avo);
	public List<IdFindVO> idFindAuthnum(IdFindVO avo);
	public List<MemberVO> idFind(MemberVO mvo);
	
	public List<MemberVO> emailCntCheckPW(MemberVO mvo);
	public int tempPwInsert(PwFindVO pvo);
	public List<PwFindVO> pwFindAuthnum(PwFindVO pvo);
	
	public List<MemberVO> kakaoLogin(MemberVO mvo);
	public int kakaoInsert(MemberVO mvo);
}
