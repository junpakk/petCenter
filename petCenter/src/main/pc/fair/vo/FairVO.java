package main.pc.fair.vo;

public class FairVO {
	
	private String bfnum;
	private String bfname;
	private String bfdate;
	private String bfplace;
	private String bfphoto;
	private String delyn;
	private String idate;
	private String udate;
	
	
	public FairVO() {

	}


	public FairVO(String bfnum, String bfname, String bfdate, String bfplace, String bfphoto, String delyn,
			String idate, String udate) {

		this.bfnum = bfnum;
		this.bfname = bfname;
		this.bfdate = bfdate;
		this.bfplace = bfplace;
		this.bfphoto = bfphoto;
		this.delyn = delyn;
		this.idate = idate;
		this.udate = udate;
	}


	public String getBfnum() {
		return bfnum;
	}


	public String getBfname() {
		return bfname;
	}


	public String getBfdate() {
		return bfdate;
	}


	public String getBfplace() {
		return bfplace;
	}


	public String getBfphoto() {
		return bfphoto;
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


	public void setBfnum(String bfnum) {
		this.bfnum = bfnum;
	}


	public void setBfname(String bfname) {
		this.bfname = bfname;
	}


	public void setBfdate(String bfdate) {
		this.bfdate = bfdate;
	}


	public void setBfplace(String bfplace) {
		this.bfplace = bfplace;
	}


	public void setBfphoto(String bfphoto) {
		this.bfphoto = bfphoto;
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
