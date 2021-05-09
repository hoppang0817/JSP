package Dto;

public class paymentDto {
	private int p_no;
	private String startDate;
	private String endDate;
	private int m_id;
	private int c_num;
	private String m_name;
	
	
	public paymentDto() {
		super();
	}
	
	public paymentDto(int p_no, String startDate, String endDate, int m_id, int c_num) {
		super();
		this.p_no = p_no;
		this.startDate = startDate;
		this.endDate = endDate;
		this.m_id = m_id;
		this.c_num = c_num;
	}
	
	
	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
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
