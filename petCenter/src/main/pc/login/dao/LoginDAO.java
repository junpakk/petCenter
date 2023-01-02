package main.pc.login.dao;

import java.util.List;

import main.pc.login.vo.IdFindVO;
import main.pc.login.vo.PwFindVO;
import main.pc.member.vo.MemberVO;

public interface LoginDAO {

	public List<MemberVO> loginCheck(MemberVO mvo);
	
	public List<MemberVO> emailCntCheck(MemberVO mvo);
	public int tempAuthInsert(IdFindVO avo);
	public List<IdFindVO> idFindAuthnum(IdFindVO avo);
	public List<MemberVO> idFind(MemberVO mvo);
	
	public List<MemberVO> emailCntCheckPW(MemberVO mvo);
	public int tempPwInsert(PwFindVO pvo);
	public List<PwFindVO> pwFindAuthnum(PwFindVO pvo);
	
	public List<MemberVO> snsLogin(MemberVO mvo);
	public int snsInsert(MemberVO mvo);
}
