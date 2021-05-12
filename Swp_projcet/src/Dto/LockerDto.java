package Dto;

public class LockerDto {

	private int l_num;
	private String l_start;
	private String l_end;
	private int m_num;
	
	
	public LockerDto() {
		super();
	}


	public LockerDto(int l_num, String l_start, String l_end, int m_num) {
		super();
		this.l_num = l_num;
		this.l_start = l_start;
		this.l_end = l_end;
		this.m_num = m_num;
	}


	public int getL_num() {
		return l_num;
	}


	public void setL_num(int l_num) {
		this.l_num = l_num;
	}


	public String getL_start() {
		return l_start;
	}


	public void setL_start(String l_start) {
		this.l_start = l_start;
	}


	public String getL_end() {
		return l_end;
	}


	public void setL_end(String l_end) {
		this.l_end = l_end;
	}


	public int getM_num() {
		return m_num;
	}


	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	
	
}
