package main.pc.map.vo;

public class MapVO {
	
	private String mapnum;
	private String mid;
	private String maplat;
	private String maplon;
	private String maplaps;
	private String delyn;
	private String idate;
	private String udate;

	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	
	 //search 변수
	private String searchFilter;
	private String keyword;
	private String startDate;
	private String endDate;	
	
	public MapVO() {
		// TODO Auto-generated constructor stub
	}

	public MapVO(String mapnum, String mid, String maplat, String maplon, String maplaps, String delyn, String idate, String udate) {

		this.mapnum = mapnum;
		this.mid = mid;
		this.maplat = maplat;
		this.maplon = maplon;
		this.maplaps = maplaps;
		this.delyn = delyn;
		this.idate = idate;
		this.udate = udate;
	}

	
	
	public MapVO(String mapnum, String mid, String maplat, String maplon, String maplaps, String delyn, String idate, String udate,
			String pageSize, String groupSize, String curPage, String totalCount, String searchFilter, String keyword,
			String startDate, String endDate) {
		super();
		this.mapnum = mapnum;
		this.mid = mid;
		this.maplat = maplat;
		this.maplon = maplon;
		this.maplaps = maplaps;
		this.delyn = delyn;
		this.idate = idate;
		this.udate = udate;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
		this.searchFilter = searchFilter;
		this.keyword = keyword;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public String getMapnum() {
		return mapnum;
	}

	public String getMaplat() {
		return maplat;
	}

	public String getMaplon() {
		return maplon;
	}
	
	public String getMaplaps() {
		return maplaps;
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

	public void setMapnum(String mapnum) {
		this.mapnum = mapnum;
	}

	public void setMaplat(String maplat) {
		this.maplat = maplat;
	}

	public void setMaplon(String maplon) {
		this.maplon = maplon;
	}
	
	public void setMaplaps(String maplaps) {
		this.maplaps = maplaps;
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

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
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
		return "MapVO [mapnum=" + mapnum + ", mid=" + mid + ", maplat=" + maplat + ", maplon=" + maplon + ", maplaps=" + maplaps + ", delyn=" + delyn + ", idate="
				+ idate + ", udate=" + udate + "]";
	}
	
	

}
