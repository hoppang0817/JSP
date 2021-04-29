package Dto;

public class ClassDto {

	private int c_num;
	private String c_name;
	private int c_limitedNum; //제한 인원
	private String c_time;//수업시간
	private String timeHour; //수업시간(시)
	private String timeMinute;//수업시간(분)
	private String c_grade; // 초,중,고급 으로나뉨
	private int count;
	
	

	public ClassDto() {
		super();
	}



	public ClassDto(int c_num, String c_name, int c_limitedNum, String c_time, String c_grade, int count) {
		super();
		this.c_num = c_num;
		this.c_name = c_name;
		this.c_limitedNum = c_limitedNum;
		this.c_time = c_time;
		this.c_grade = c_grade;
		this.count = count;
	}



	public ClassDto(int c_num, String c_name, int c_limitedNum, String c_time, String c_grade) {
		super();
		this.c_num = c_num;
		this.c_name = c_name;
		this.c_limitedNum = c_limitedNum;
		this.c_time = c_time;
		this.c_grade = c_grade;
	}

	


	public ClassDto(int c_num, String c_name, int c_limitedNum, String timeHour, String timeMinute, String c_grade) {
		super();
		this.c_num = c_num;
		this.c_name = c_name;
		this.c_limitedNum = c_limitedNum;
		this.timeHour = timeHour;
		this.timeMinute = timeMinute;
		this.c_grade = c_grade;
	}



	
	public String getTimeHour() {
		return timeHour;
	}



	public void setTimeHour(String timeHour) {
		this.timeHour = timeHour;
	}



	public String getTimeMinute() {
		return timeMinute;
	}



	public void setTimeMinute(String timeMinute) {
		this.timeMinute = timeMinute;
	}



	public int getC_num() {
		return c_num;
	}



	public void setC_num(int c_num) {
		this.c_num = c_num;
	}



	public String getC_name() {
		return c_name;
	}



	public void setC_name(String c_name) {
		this.c_name = c_name;
	}



	public int getC_limitedNum() {
		return c_limitedNum;
	}



	public void setC_limitedNum(int c_limitedNum) {
		this.c_limitedNum = c_limitedNum;
	}



	public String getC_time() {
		return c_time;
	}



	public void setC_time(String c_time) {
		this.c_time = c_time;
	}



	public String getC_grade() {
		return c_grade;
	}



	public void setC_grade(String c_grade) {
		this.c_grade = c_grade;
	}



	public int getCount() {
		return count;
	}



	public void setCount(int count) {
		this.count = count;
	}
	
	
	

}

