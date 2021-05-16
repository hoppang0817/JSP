package Dto;

public class checkDto {

	private String c_day;
	private String c_time;
	private int c_num;//반 번호
	private int m_id;
	public checkDto() {
		super();
	}
	public checkDto(String c_day, String c_time, int c_num, int m_id) {
		super();
		this.c_day = c_day;
		this.c_time = c_time;
		this.c_num = c_num;
		this.m_id = m_id;
	}
	public String getC_day() {
		return c_day;
	}
	public void setC_day(String c_day) {
		this.c_day = c_day;
	}
	public String getC_time() {
		return c_time;
	}
	public void setC_time(String c_time) {
		this.c_time = c_time;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	
	
}
