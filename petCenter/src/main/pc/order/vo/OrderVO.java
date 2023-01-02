package main.pc.order.vo;

public class OrderVO {
	
	private String onum;
	private String mnum;
	private String mname;//추가사항 작성해야 함
	private String cnum;
	private String oname;
	private String ocnt;
	private String opsum;
	private String mhp;//추가사항 작성해야 함
	private String ozcode;
	private String oraddress;
	private String oraddressd;
	private String ojibun;
	private String delyn;
	private String idate;
	private String udate;
	
	//생성자
	public OrderVO() {
	}

	//getter
	public String getOnum() {
		return onum;
	}

	public String getMnum() {
		return mnum;
	}

	public String getMname() {
		return mname;
	}

	public String getCnum() {
		return cnum;
	}

	public String getOname() {
		return oname;
	}

	public String getOcnt() {
		return ocnt;
	}

	public String getOpsum() {
		return opsum;
	}

	public String getMhp() {
		return mhp;
	}

	public String getOzcode() {
		return ozcode;
	}

	public String getOraddress() {
		return oraddress;
	}

	public String getOraddressd() {
		return oraddressd;
	}

	public String getOjibun() {
		return ojibun;
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
	public void setOnum(String onum) {
		this.onum = onum;
	}

	public void setMnum(String mnum) {
		this.mnum = mnum;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public void setCnum(String cnum) {
		this.cnum = cnum;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public void setOcnt(String ocnt) {
		this.ocnt = ocnt;
	}

	public void setOpsum(String opsum) {
		this.opsum = opsum;
	}

	public void setMhp(String mhp) {
		this.mhp = mhp;
	}

	public void setOzcode(String ozcode) {
		this.ozcode = ozcode;
	}

	public void setOraddress(String oraddress) {
		this.oraddress = oraddress;
	}

	public void setOraddressd(String oraddressd) {
		this.oraddressd = oraddressd;
	}

	public void setOjibun(String ojibun) {
		this.ojibun = ojibun;
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
		return "OrderVO [onum=" + onum + ", mnum=" + mnum + ", mname=" + mname + ", cnum=" + cnum + ", oname=" + oname
				+ ", ocnt=" + ocnt + ", opsum=" + opsum + ", mhp=" + mhp + ", ozcode=" + ozcode + ", oraddress="
				+ oraddress + ", oraddressd=" + oraddressd + ", ojibun=" + ojibun + ", delyn=" + delyn + ", idate="
				+ idate + ", udate=" + udate + "]";
	}
	
	/*
	 CREATE TABLE PC_ORDER(
	 ONUM 		VARCHAR2(20) PRIMARY KEY 
	,MNUM 		VARCHAR2(20)
    ,MNAME      VARCHAR2(200)
	,CNUM 		VARCHAR2(20) 
	,ONAME 		VARCHAR2(500) 
	,OCNT 		VARCHAR2(200) 
	,OPSUM 		VARCHAR2(200)   NOT NULL
    ,MPH        VARCHAR2(20)    
	,OZCODE 	VARCHAR2(6)     NOT NULL
	,ORADDRESS 	VARCHAR2(200)   NOT NULL
	,ORADDRESSD VARCHAR2(200)   NOT NULL
	,OJIBUN 	VARCHAR2(200)   NOT NULL
	,DELYN 		VARCHAR2(1)     NOT NULL
	,IDATE      DATE
	,UDATE 		DATE
	);

	DROP TABLE PC_ORDER;
	 */

}
