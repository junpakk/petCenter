package main.pc.koji.vo;

public class KojiVO {
	
	
	private String mid;
	private String ktitle;
	private String kcontent;
	private String delyn;
	private String idate;
	private String udate;
	
	
	public String getMid() {
		return mid;
	}


	public String getKtitle() {
		return ktitle;
	}


	public String getKcontent() {
		return kcontent;
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


	public void setMid(String mid) {
		this.mid = mid;
	}


	public void setKtitle(String ktitle) {
		this.ktitle = ktitle;
	}


	public void setKcontent(String kcontent) {
		this.kcontent = kcontent;
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


	public KojiVO() {
		
	}


	public KojiVO(String mid, String ktitle, String kcontent, String delyn, String idate, String udate) {
		
		this.mid = mid;
		this.ktitle = ktitle;
		this.kcontent = kcontent;
		this.delyn = delyn;
		this.idate = idate;
		this.udate = udate;
	}


}
