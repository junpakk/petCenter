package main.pc.product.vo;

public class ProductVO {
	
	private String pnum;
	private String pname;
	private String pprice;
	private String pcategory;
	private String pdetail;
	private String pphoto;
	private String delyn;
	private String idate;
	private String udate;
	
	
	//getter
	public String getPnum() {
		return pnum;
	}
	public String getPname() {
		return pname;
	}
	public String getPprice() {
		return pprice;
	}
	public String getPcategory() {
		return pcategory;
	}
	public String getPdetail() {
		return pdetail;
	}
	public String getPphoto() {
		return pphoto;
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
	
	//setter
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public void setPprice(String pprice) {
		this.pprice = pprice;
	}
	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}
	public void setPdetail(String pdetail) {
		this.pdetail = pdetail;
	}
	public void setPphoto(String pphoto) {
		this.pphoto = pphoto;
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
	
	@Override
	public String toString() {
		return "ProductVO [pnum=" + pnum + ", pname=" + pname + ", pprice=" + pprice + ", pcategory=" + pcategory
				+ ", pdetail=" + pdetail + ", pphoto=" + pphoto + ", delyn=" + delyn + ", idate=" + idate + ", udate="
				+ udate + "]";
	}
	
}
