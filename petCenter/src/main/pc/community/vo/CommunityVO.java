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
	 
	private String blnum;
	private int likey;
	private int hate;
	
	//페이징
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	
	//검색
	private String searchFilter;
	private String keyword;
	private String startDate;
	private String endDate;	 
	 
	public CommunityVO(){}

	public CommunityVO(String bcnum, String bcc, String mid, String bctitle, String bccontent, String delyn,
			String idate, String udate, String blnum, int likey, int hate) {

		this.bcnum = bcnum;
		this.bcc = bcc;
		this.mid = mid;
		this.bctitle = bctitle;
		this.bccontent = bccontent;
		this.delyn = delyn;
		this.idate = idate;
		this.udate = udate;
		this.blnum = blnum;
		this.likey = likey;
		this.hate = hate;
	}

	public CommunityVO(String bcnum, String bcc, String mid, String bctitle, String bccontent, String delyn,
			String idate, String udate, String blnum, int likey, int hate, String pageSize, String groupSize,
			String curPage, String totalCount, String searchFilter, String keyword, String startDate, String endDate) {
		super();
		this.bcnum = bcnum;
		this.bcc = bcc;
		this.mid = mid;
		this.bctitle = bctitle;
		this.bccontent = bccontent;
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
		this.searchFilter = searchFilter;
		this.keyword = keyword;
		this.startDate = startDate;
		this.endDate = endDate;
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



	public String getBlnum() {
		return blnum;
	}



	public int getLikey() {
		return likey;
	}



	public int getHate() {
		return hate;
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

	public String getSearchFilter() {
		return searchFilter;
	}

	public String getKeyword() {
		return keyword;
	}

	public String getStartDate() {
		return startDate;
	}

	public String getEndDate() {
		return endDate;
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

	public void setSearchFilter(String searchFilter) {
		this.searchFilter = searchFilter;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "CommunityVO [bcnum=" + bcnum + ", bcc=" + bcc + ", mid=" + mid + ", bctitle=" + bctitle + ", bccontent="
				+ bccontent + ", delyn=" + delyn + ", idate=" + idate + ", udate=" + udate + ", blnum=" + blnum
				+ ", likey=" + likey + ", hate=" + hate + ", pageSize=" + pageSize + ", groupSize=" + groupSize
				+ ", curPage=" + curPage + ", totalCount=" + totalCount + ", searchFilter=" + searchFilter
				+ ", keyword=" + keyword + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
		
}
