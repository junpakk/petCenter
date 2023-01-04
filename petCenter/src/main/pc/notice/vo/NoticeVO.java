package main.pc.notice.vo;

public class NoticeVO {
	
	private String bnnum;
	private String bntitle;
	private String bncontent;
	private String bnphoto;
	private String delyn;
	private String idate;
	private String udate;
	
	public String getBnnum() {
		return bnnum;
	}

	public String getBntitle() {
		return bntitle;
	}

	public String getBncontent() {
		return bncontent;
	}

	public String getBnphoto() {
		return bnphoto;
	}

	public String getDelyn() {
		return delyn;
	}

	public String getIdate() {
		return idate;
	}

	public String getUdate() {
		return udate;
	}

	public void setBnnum(String bnnum) {
		this.bnnum = bnnum;
	}

	public void setBntitle(String bntitle) {
		this.bntitle = bntitle;
	}

	public void setBncontent(String bncontent) {
		this.bncontent = bncontent;
	}

	public void setBnphoto(String bnphoto) {
		this.bnphoto = bnphoto;
	}

	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}

	public void setIdate(String idate) {
		this.idate = idate;
	}

	public void setUdate(String udate) {
		this.udate = udate;
	}

	public NoticeVO() {
	
	}

	public NoticeVO(String bnnum, String bntitle, String bncontent, String bnphoto, String delyn, String idate,
			String udate) {
	
		this.bnnum = bnnum;
		this.bntitle = bntitle;
		this.bncontent = bncontent;
		this.bnphoto = bnphoto;
		this.delyn = delyn;
		this.idate = idate;
		this.udate = udate;
	}
}
