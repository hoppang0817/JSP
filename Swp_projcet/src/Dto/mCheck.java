package Dto;

public class mCheck {

	private int cnum;
	private String c_day;
	private String c_time;
	private int m_id;
	private int c_num;
	private int rnum;
	
	
	public mCheck() {
		super();
	}

	

	public mCheck(int cnum, String c_day, String c_time, int m_id, int c_num, int rnum) {
		super();
		this.cnum = cnum;
		this.c_day = c_day;
		this.c_time = c_time;
		this.m_id = m_id;
		this.c_num = c_num;
		this.rnum = rnum;
	}



	public int getCnum() {
		return cnum;
	}


	public void setCnum(int cnum) {
		this.cnum = cnum;
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


	public int getRnum() {
		return rnum;
	}


	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	
	
}
