package Dto;

public class LockerDto {

	private int l_num;
	private String l_start;
	private String l_end;
	private int m_id;
	public LockerDto() {
		super();
	}
	public LockerDto(int l_num, String l_start, String l_end, int m_id) {
		super();
		this.l_num = l_num;
		this.l_start = l_start;
		this.l_end = l_end;
		this.m_id = m_id;
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
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	
	
	
}
