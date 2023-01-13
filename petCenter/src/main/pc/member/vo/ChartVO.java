package main.pc.member.vo;

public class ChartVO {
	
	private String pet;
	private int count;
	
	public ChartVO() {

	}
	
	public ChartVO(String pet, int count) {

		this.pet = pet;
		this.count = count;
	}
	
	public String getPet() {
		return pet;
	}
	public int getCount() {
		return count;
	}
	public void setPet(String pet) {
		this.pet = pet;
	}
	public void setCount(int count) {
		this.count = count;
	}
	

}
