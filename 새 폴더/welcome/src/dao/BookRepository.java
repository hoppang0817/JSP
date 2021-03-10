package dao;

import java.util.ArrayList;

import dto.Book;

public class BookRepository {
	
	public ArrayList<Book> listOfBooks = new ArrayList<Book>();
	public static BookRepository instance = new BookRepository();
	
	public static BookRepository getInstance() {
		return instance;
	}
	
	
	public BookRepository() {
		Book html = new Book("b1234", "[Hello coding]HTML5+CSS3",15000);
		html.setAuthor("황재호");
		html.setDescription("워드나 PPT문서를 만들 수 있나요? 그러면문제 없습니다.지금 바로 웹페이지 제작에 도전해보세요. 지금 당장 컴퓨터가 없어도 괜찮습니다.토드와 실행 화면이 바로 보여서 눈으....");
		html.setPublisher("한빛미디어");
		html.setCategory("IT");
		html.setUnitsInStock(100);
		html.setTotalPages(350);
		html.setReleaseDate("04/2020");
		html.setCondition("신규도서");
		html.setFilename("b1234.jpg");
		
		Book java = new Book("b1256", "[IT모바일]쉽게 배우는 자바 프로그래밍",27000);
		java.setAuthor("우종중");
		java.setDescription("객체 자향의 핵심과 자바의 현대적 기능을 충실히 다루면서도초보자가 쉽게 학습할 수 있게 구성했습니다. 사각화 도구를 활용한 개년 설명과 군더더기 없는 핵심 코드를 통해 개념과 구현...");
		java.setPublisher("한빛아카데미");
		java.setCategory("IT");
		java.setUnitsInStock(200);
		java.setTotalPages(400);
		java.setReleaseDate("02/2019");
		java.setCondition("중고도서");
		java.setFilename("b1256.jpg");
		
		Book spring = new Book("b1301","[IT모바일]스프링4 입문",27000);
		spring.setAuthor("하세가와 유이치,오오노 와타루,토키 코헤이(권은철,전민수)");
		spring.setDescription("스프링은 단순히 사용 방법만 익히는 것보다 아키첵처를 어떻게 이해하고 설계하는지가 더 중요합니다. 예제를 복사해 붙여넣는식으로는 실제 개발에서 스프링을 제대로 활용할 수 없습니다....");
		spring.setPublisher("한빛미디어");
		spring.setCategory("IT");
		spring.setUnitsInStock(100);
		spring.setTotalPages(300);
		spring.setReleaseDate("05/2020");
		spring.setCondition("신규도서");
		spring.setFilename("b1301.jpg");
		
		listOfBooks.add(html);
		listOfBooks.add(java);
		listOfBooks.add(spring);
	}
	
	public ArrayList<Book> getAllBooks(){
		return listOfBooks;
	}
	
	public Book getBookById(String bookId) {
		Book bookById = null;
		
		for(int i=0;i<listOfBooks.size();i++) {
			Book book = listOfBooks.get(i);
			if(book !=null && book.getBookId() !=null && book.getBookId().equals(bookId)) {
				bookById = book;
				break;
			}
		}
		return bookById;
	}
	public void addBook(Book book) {
		listOfBooks.add(book);
	}
}
