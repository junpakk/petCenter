package main.pc.login.vo;

public class TempAuthVO {

	private String anum;
	private String authnum;
	private String memail;
	private String idate;
	public TempAuthVO() {
	}
	public TempAuthVO(String anum, String authnum, String memail, String idate) {
		this.anum = anum;
		this.authnum = authnum;
		this.memail = memail;
		this.idate = idate;
	}
	public String getAnum() {
		return anum;
	}
	public void setAnum(String anum) {
		this.anum = anum;
	}
	public String getAuthnum() {
		return authnum;
	}
	public void setAuthnum(String authnum) {
		this.authnum = authnum;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getInsertdate() {
		return idate;
	}
	public void setInsertdate(String idate) {
		this.idate = idate;
	}
	
}
