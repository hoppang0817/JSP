package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {

	//상품을 어레이 리스트에 저장하는 리스트오브프로더츠를 생성한다
	private ArrayList<Product> listOfProducts=new ArrayList<Product>();
	
	// static객체를 만들어서 새로 입력한 제품이 저장되어 있도록한다.
	private static ProductRepository instance = new ProductRepository();
	
	//한번 만들어진 static객체 instance를 리턴한다
	//인스턴스에 공통적으로 사용해야하는 것에 static을 붙인다.
	public static ProductRepository getInstance() {
		return instance;
	}
	
	//상품추가하는메소드
	public void addProduct(Product newProduct) {
		listOfProducts.add(newProduct);
	}
	//생성자 =>상품객체를 생성하여 리스트에 추가
	public ProductRepository() {
		Product phone = new Product("P1234", "iPhone 6s", 800000);
		phone.setDescription("4.7-inch, 1334X750 Renina HD display, 8-megapixel iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setFilename("P1234.png");

		Product notebook = new Product("P1235", "LG PC 그램", 1500000);
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setFilename("P1235.png");

		Product tablet = new Product("P1236", "Galaxy Tab S", 900000);
		tablet.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		tablet.setFilename("P1236.png");

		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
	
	//어레이 리스트는 외부접근불가(private)임으로 접근할수있게 get메소드 생성
	public ArrayList<Product> getAllProduct(){
		return listOfProducts;
	}
	//상품 상세정보를 가져오는 메소드(제품아이디 입력)
	public Product getProductById(String productId) {
		Product productById = null;
		//제품 리스트에서 제품 아이디로 검사해서 아이디가 같은 제품 객체를 리턴
		for(int i=0;i<listOfProducts.size();i++) {
			Product product = listOfProducts.get(i);
			if(product != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	
	
	
	
}
