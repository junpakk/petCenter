package main.pc.like.vo;

public class LikeVO {
	
	private String blnum;
	private String mnum;
	private String bcnum;
	private String likey;
	private String hate;
	private String delyn;
	private String idate;
	
	public LikeVO() {

	}

	public LikeVO(String blnum, String mnum, String bcnum, String likey, String hate, String delyn, String idate) {

		this.blnum = blnum;
		this.mnum = mnum;
		this.bcnum = bcnum;
		this.likey = likey;
		this.hate = hate;
		this.delyn = delyn;
		this.idate = idate;
	}

	
	public String getBlnum() {
		return blnum;
	}

	public String getMnum() {
		return mnum;
	}

	public String getBcnum() {
		return bcnum;
	}

	public String getLikey() {
		return likey;
	}

	public String getHate() {
		return hate;
	}

	public String getDelyn() {
		return delyn;
	}

	public String getIdate() {
		return idate;
	}

	public void setBlnum(String blnum) {
		this.blnum = blnum;
	}

	public void setMnum(String mnum) {
		this.mnum = mnum;
	}

	public void setBcnum(String bcnum) {
		this.bcnum = bcnum;
	}

	public void setLikey(String likey) {
		this.likey = likey;
	}

	public void setHate(String hate) {
		this.hate = hate;
	}

	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}

	public void setIdate(String idate) {
		this.idate = idate;
	}

	
}
