package Dto;

public class StaffDto {

	private String s_id;
	private String s_pw;
	private String s_phone;
	private String s_arrd;
	private String s_name;
	
	
	
	
	
	
	public StaffDto() {
		super();
	}
	
	
	public StaffDto(String s_id, String s_pw, String s_phone, String s_arrd, String s_name) {
		super();
		this.s_id = s_id;
		this.s_pw = s_pw;
		this.s_phone = s_phone;
		this.s_arrd = s_arrd;
		this.s_name = s_name;
	}


	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getS_pw() {
		return s_pw;
	}
	public void setS_pw(String s_pw) {
		this.s_pw = s_pw;
	}
	public String getS_phone() {
		return s_phone;
	}
	public void setS_phone(String s_phone) {
		this.s_phone = s_phone;
	}
	public String getS_arrd() {
		return s_arrd;
	}
	public void setS_arrd(String s_arrd) {
		this.s_arrd = s_arrd;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	
	
	
}
