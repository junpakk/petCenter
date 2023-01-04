package main.pc.cart.vo;

public class CartVO {
	
	private String cnum;
	private String mnum;
	private String cname;
	private String ccnt;
	private String cprice;
	private String delivery;
	private String tprice;
	private String cphoto;
	private String delyn;
	private String idate;
	private String udate;
	
	
	public CartVO() {
	}
	
	
	//getter
	public String getCnum() {
		return cnum;
	}


	public String getMnum() {
		return mnum;
	}


	public String getCname() {
		return cname;
	}


	public String getCcnt() {
		return ccnt;
	}


	public String getCprice() {
		return cprice;
	}


	public String getDelivery() {
		return delivery;
	}


	public String getTprice() {
		return tprice;
	}


	public String getCphoto() {
		return cphoto;
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
	public void setCnum(String cnum) {
		this.cnum = cnum;
	}


	public void setMnum(String mnum) {
		this.mnum = mnum;
	}


	public void setCname(String cname) {
		this.cname = cname;
	}


	public void setCcnt(String ccnt) {
		this.ccnt = ccnt;
	}


	public void setCprice(String cprice) {
		this.cprice = cprice;
	}


	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}


	public void setTprice(String tprice) {
		this.tprice = tprice;
	}


	public void setCphoto(String cphoto) {
		this.cphoto = cphoto;
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
		return "CartVO [cnum=" + cnum + ", mnum=" + mnum + ", cname=" + cname + ", ccnt=" + ccnt + ", cprice=" + cprice
				+ ", delivery=" + delivery + ", tprice=" + tprice + ", cphoto=" + cphoto + ", delyn=" + delyn
				+ ", idate=" + idate + ", udate=" + udate + "]";
	}
	
}
