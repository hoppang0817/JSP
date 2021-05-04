package Dto;

public class paymentDto {
	private String startDate;
	private String endDate;
	private int m_id;
	private int c_num;
	
	
	public paymentDto() {
		super();
	}
	
	public paymentDto(String startDate, String endDate, int m_id, int c_num) {
		super();
		this.startDate = startDate;
		this.endDate = endDate;
		this.m_id = m_id;
		this.c_num = c_num;
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
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	
	

}
