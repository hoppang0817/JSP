package Dto;

public class MemberDto {

	private int m_id;
	private String m_name;
	private String m_phone;
	private String m_arrd;
	private int c_num; //수업 번호
	
	
	
	
	public MemberDto() {
		super();
	}
	
	public MemberDto(int m_id, String m_name, String m_phone, String m_arrd, int c_num) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_phone = m_phone;
		this.m_arrd = m_arrd;
		this.c_num = c_num;
	}

	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_arrd() {
		return m_arrd;
	}
	public void setM_arrd(String m_arrd) {
		this.m_arrd = m_arrd;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	
	
	
	
	
}


