package main.pc.login.vo;

public class PwFindVO {
	private String pnum;
	private String ppw;
	private String mid;
	private String memail;
	private String idate;
	public PwFindVO() {
	}
	public PwFindVO(String pnum, String ppw, String mid, String memail, String idate) {
		this.pnum = pnum;
		this.ppw = ppw;
		this.mid = mid;
		this.memail = memail;
		this.idate = idate;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public String getPpw() {
		return ppw;
	}
	public void setPpw(String ppw) {
		this.ppw = ppw;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getIdate() {
		return idate;
	}
	public void setIdate(String idate) {
		this.idate = idate;
	}
}
