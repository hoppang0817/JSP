package ch04.com.dao;

public class Person {
//	멤버변수들은 private으로작성
	private int id = 20181004;
	private String name = "홍길순";

	public Person() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
