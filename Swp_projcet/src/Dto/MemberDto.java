package Dto;

public class MemberDto {

	private int m_id;
	private String m_name;
	private String m_phone;
	private String lnum; //전화번호 끝자리
	private String m_arrd;
	private String postCoed; //우편번호
	private String arrd1;  //상세주소
	private String m_sex;
	private String m_email;
	private String email2;
	private int c_num; //수업 번호
	
	
	
	
	public MemberDto() {
		super();
	}
	
	public MemberDto(int m_id, String m_name, String m_phone, String m_arrd, int c_num,String m_sex,String m_email) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_phone = m_phone;
		this.m_arrd = m_arrd;
		this.m_sex = m_sex;
		this.m_email = m_email;
		this.c_num = c_num;
	}

	
	
	public MemberDto(int m_id, String m_name, String m_phone, String lnum, String m_arrd, String postCoed, String arrd1,
			String m_sex, String m_email, String email2, int c_num) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_phone = m_phone;
		this.lnum = lnum;
		this.m_arrd = m_arrd;
		this.postCoed = postCoed;
		this.arrd1 = arrd1;
		this.m_sex = m_sex;
		this.m_email = m_email;
		this.email2 = email2;
		this.c_num = c_num;
	}

	
	public String getLnum() {
		return lnum;
	}

	public void setLum(String lnum) {
		this.lnum = lnum;
	}

	public String getPostCoed() {
		return postCoed;
	}

	public void setPostCoed(String postCoed) {
		this.postCoed = postCoed;
	}

	public String getArrd1() {
		return arrd1;
	}

	public void setArrd1(String arrd1) {
		this.arrd1 = arrd1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_sex() {
		return m_sex;
	}

	public void setM_sex(String m_sex) {
		this.m_sex = m_sex;
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


