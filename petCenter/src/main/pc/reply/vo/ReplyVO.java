package main.pc.reply.vo;

public class ReplyVO {
	
	private String brnum;
	private String mnum;
	private String mid;
	private String bcnum;
	private String brcontent;
	private String delyn;
	private String idate;
	private String udate;
	
	public ReplyVO() {
		
	}

	public ReplyVO(String brnum, String mnum, String mid, String bcnum, String brcontent, String delyn, String idate,
			String udate) {

		this.brnum = brnum;
		this.mnum = mnum;
		this.mid = mid;
		this.bcnum = bcnum;
		this.brcontent = brcontent;
		this.delyn = delyn;
		this.idate = idate;
		this.udate = udate;
	}

	public String getBrnum() {
		return brnum;
	}

	public String getMnum() {
		return mnum;
	}

	public String getMid() {
		return mid;
	}

	public String getBcnum() {
		return bcnum;
	}

	public String getBrcontent() {
		return brcontent;
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

	public void setBrnum(String brnum) {
		this.brnum = brnum;
	}

	public void setMnum(String mnum) {
		this.mnum = mnum;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public void setBcnum(String bcnum) {
		this.bcnum = bcnum;
	}

	public void setBrcontent(String brcontent) {
		this.brcontent = brcontent;
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

	
	
	
	
}

