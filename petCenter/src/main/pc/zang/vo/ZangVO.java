package main.pc.zang.vo;

public class ZangVO {
	
	private String bznum;
	private String bzc;
	private String mid;
	private String bztitle;
	private String bzcontent;
	private String delyn;
	private String idate;
	private String udate;
	
	public String getBznum() {
		return bznum;
	}

	public String getBzc() {
		return bzc;
	}

	public String getMid() {
		return mid;
	}

	public String getBztitle() {
		return bztitle;
	}

	public String getBzcontent() {
		return bzcontent;
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

	public void setBznum(String bznum) {
		this.bznum = bznum;
	}

	public void setBzc(String bzc) {
		this.bzc = bzc;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public void setBztitle(String bztitle) {
		this.bztitle = bztitle;
	}

	public void setBzcontent(String bzcontent) {
		this.bzcontent = bzcontent;
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

	public ZangVO() {
		
	}

	public ZangVO(String bznum, String bzc, String mid, String bztitle, String bzcontent, String delyn, String idate,
			String udate) {
	
		this.bznum = bznum;
		this.bzc = bzc;
		this.mid = mid;
		this.bztitle = bztitle;
		this.bzcontent = bzcontent;
		this.delyn = delyn;
		this.idate = idate;
		this.udate = udate;
	}
	
	

}
