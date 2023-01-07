package main.pc.photo.vo;

public class PhotoVO {
	
	private String bpnum;
	private String mnum;
	private String mid;
	private String bptitle;
	private String bpphoto;
	private String bphit;
	private String delyn;
	private String idate;
	private String udate;
	 
	private String blnum;
	private int likey;
	private int hate;
	
	//페이징
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	


	public PhotoVO() {}



	public PhotoVO(String bpnum, String mnum, String mid, String bptitle, String bpphoto, String bphit, String delyn,
			String idate, String udate, String blnum, int likey, int hate, String pageSize, String groupSize,
			String curPage, String totalCount) {

		this.bpnum = bpnum;
		this.mnum = mnum;
		this.mid = mid;
		this.bptitle = bptitle;
		this.bpphoto = bpphoto;
		this.bphit = bphit;
		this.delyn = delyn;
		this.idate = idate;
		this.udate = udate;
		this.blnum = blnum;
		this.likey = likey;
		this.hate = hate;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
	}



	public String getBpnum() {
		return bpnum;
	}



	public String getMnum() {
		return mnum;
	}



	public String getMid() {
		return mid;
	}



	public String getBptitle() {
		return bptitle;
	}



	public String getBpphoto() {
		return bpphoto;
	}



	public String getBphit() {
		return bphit;
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



	public String getBlnum() {
		return blnum;
	}



	public int getLikey() {
		return likey;
	}



	public int getHate() {
		return hate;
	}



	public String getPageSize() {
		return pageSize;
	}



	public String getGroupSize() {
		return groupSize;
	}



	public String getCurPage() {
		return curPage;
	}



	public String getTotalCount() {
		return totalCount;
	}



	public void setBpnum(String bpnum) {
		this.bpnum = bpnum;
	}



	public void setMnum(String mnum) {
		this.mnum = mnum;
	}



	public void setMid(String mid) {
		this.mid = mid;
	}



	public void setBptitle(String bptitle) {
		this.bptitle = bptitle;
	}



	public void setBpphoto(String bpphoto) {
		this.bpphoto = bpphoto;
	}



	public void setBphit(String bphit) {
		this.bphit = bphit;
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



	public void setBlnum(String blnum) {
		this.blnum = blnum;
	}



	public void setLikey(int likey) {
		this.likey = likey;
	}



	public void setHate(int hate) {
		this.hate = hate;
	}



	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}



	public void setGroupSize(String groupSize) {
		this.groupSize = groupSize;
	}



	public void setCurPage(String curPage) {
		this.curPage = curPage;
	}



	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}



	
	
	

}
