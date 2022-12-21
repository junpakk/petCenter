package main.pc.member.vo;

public class MemberVO {
	
	private String mnum;
	private String mname;
	private String mid;
	private String mpw;
	private String mhp;
	private String memail;
	private String mpet;
	private String minfo;
	private String delyn;
	private String idate;
	private String udate;
	
	//페이징 이동 필드
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	
	// search 변수
	private String keyword;			// 검색어
	private String searchFilter;	// 검색조건
	private String startDate;		// 검색기간 시작일
	private String endDate;			// 검색기간 종료일
	
	// sns 로그인
	private String snstype;			// 01:카카오, 02:네이버
	private String snsid;
	private String snsemail;
	
	
	@Override
	public String toString() {
		return "MemberVO [mnum=" + mnum + ", mname=" + mname + ", mid=" + mid + ", mpw=" + mpw + ", mhp=" + mhp
				+ ", memail=" + memail + ", mpet=" + mpet + ", minfo=" + minfo + ", delyn=" + delyn + ", idate=" + idate
				+ ", udate=" + udate + ", pageSize=" + pageSize + ", groupSize=" + groupSize + ", curPage=" + curPage
				+ ", totalCount=" + totalCount + ", keyword=" + keyword + ", searchFilter=" + searchFilter
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", snstype=" + snstype + ", snsid=" + snsid
				+ ", snsemail=" + snsemail + "]";
	}
	public MemberVO() {
	}
	public MemberVO(String mnum, String mname, String mid, String mpw, String mhp, String memail, String mpet,
			String minfo, String delyn, String idate, String udate, String pageSize, String groupSize, String curPage,
			String totalCount, String keyword, String searchFilter, String startDate, String endDate, String snstype,
			String snsid, String snsemail) {
		this.mnum = mnum;
		this.mname = mname;
		this.mid = mid;
		this.mpw = mpw;
		this.mhp = mhp;
		this.memail = memail;
		this.mpet = mpet;
		this.minfo = minfo;
		this.delyn = delyn;
		this.idate = idate;
		this.udate = udate;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
		this.keyword = keyword;
		this.searchFilter = searchFilter;
		this.startDate = startDate;
		this.endDate = endDate;
		this.snstype = snstype;
		this.snsid = snsid;
		this.snsemail = snsemail;
	}
	public String getMnum() {
		return mnum;
	}
	public void setMnum(String mnum) {
		this.mnum = mnum;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMhp() {
		return mhp;
	}
	public void setMhp(String mhp) {
		this.mhp = mhp;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMpet() {
		return mpet;
	}
	public void setMpet(String mpet) {
		this.mpet = mpet;
	}
	public String getMinfo() {
		return minfo;
	}
	public void setMinfo(String minfo) {
		this.minfo = minfo;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public String getIdate() {
		return idate;
	}
	public void setIdate(String idate) {
		this.idate = idate;
	}
	public String getUdate() {
		return udate;
	}
	public void setUdate(String udate) {
		this.udate = udate;
	}
	public String getPageSize() {
		return pageSize;
	}
	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}
	public String getGroupSize() {
		return groupSize;
	}
	public void setGroupSize(String groupSize) {
		this.groupSize = groupSize;
	}
	public String getCurPage() {
		return curPage;
	}
	public void setCurPage(String curPage) {
		this.curPage = curPage;
	}
	public String getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchFilter() {
		return searchFilter;
	}
	public void setSearchFilter(String searchFilter) {
		this.searchFilter = searchFilter;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getSnstype() {
		return snstype;
	}
	public void setSnstype(String snstype) {
		this.snstype = snstype;
	}
	public String getSnsid() {
		return snsid;
	}
	public void setSnsid(String snsid) {
		this.snsid = snsid;
	}
	public String getSnsemail() {
		return snsemail;
	}
	public void setSnsemail(String snsemail) {
		this.snsemail = snsemail;
	}
	
}
