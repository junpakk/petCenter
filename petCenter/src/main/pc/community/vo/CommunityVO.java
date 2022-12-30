package main.pc.community.vo;

public class CommunityVO {
	 private String bcnum;
	 private String bcc;
	 private String mid;
	 private String bctitle;
	 private String bccontent;
	 private String delyn;
	 private String idate;
	 private String udate;
	 
	 public CommunityVO() {
			
		}
	 
	 public String getBcnum() {
		return bcnum;
	}

	public String getBcc() {
		return bcc;
	}

	public String getMid() {
		return mid;
	}

	public String getBctitle() {
		return bctitle;
	}

	public String getBccontent() {
		return bccontent;
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

	public void setBcnum(String bcnum) {
		this.bcnum = bcnum;
	}

	public void setBcc(String bcc) {
		this.bcc = bcc;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public void setBctitle(String bctitle) {
		this.bctitle = bctitle;
	}

	public void setBccontent(String bccontent) {
		this.bccontent = bccontent;
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

	

	public CommunityVO(String bcnum, String bcc, String mid, String bctitle, String bccontent, String delyn,
			String idate, String udate) {
		
		this.bcnum = bcnum;
		this.bcc = bcc;
		this.mid = mid;
		this.bctitle = bctitle;
		this.bccontent = bccontent;
		this.delyn = delyn;
		this.idate = idate;
		this.udate = udate;
	}
	
		
}