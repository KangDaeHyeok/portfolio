package mvc.model;

import java.io.Serializable;
/*
자바빈즈를 작성할 때 java.io.Serializable 인터페이스는 생략이 가능하다.
하지만 자바빈즈 구약에 명시된 내용으로 자바빈즈에 저장된 속성을 포함한 채로 파일 시스템에 저장되거나
네트워크에 전송하려면 객체 직렬화를 제공해서 자바객체를 바이트 배열로 변환해야 하므로
Serializable을 구현하는 것이 좋으며 long타입의 static final long serialVersionUID
상수를 구현해야 한다. id값은 자동 생성이 가능하다.
*/
public class CarDTO implements Serializable{
/*	
직렬화를 할 때 serialVersionUID(SUID)값은 필수는 아니지만 선언이 없다면 내부에서 자동으로 클래스의
기본 해시값을 사용하여 유니크한 번호를 생성하여 관리하게 되는데 SUID는 직렬화와 역직렬화 과정에서
값이 서로 맞는지 확인한 후에 처리하기 때문에 값이 맞지 않다면 InvalidClassException 예외가 
발생하므로 자바에서는 SUID를 개발자가 선언하고 관리하는 방식을 권장한다.
*/
	private static final long serialVersionUID = -5733639199215267910L;
	
//	멤버필드
	private String carModel; // 차종류
	private String carname; // 차이름
	private int price; // 상품 가격 => wrapper class인 Integer로 선언해서 값이 없을 때 null이 들어갈 수 있도록 한다.
	
	/* 이미지를 담을 변수 추가 */
	private String car_image;

	//	생성자 함수
	public CarDTO() {
		super();
	}
	
	public CarDTO(String carModel, String carname, Integer price) {
		super();
		this.carModel = carModel;
		this.carname = carname;
		this.price = price;
	}

	public String getCarModel() {
		return carModel;
	}

	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}

	public String getCarname() {
		return carname;
	}

	public void setCarname(String carname) {
		this.carname = carname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	

	public String getCar_image() {
		return car_image;
	}

	public void setCar_image(String car_image) {
		this.car_image = car_image;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
	
}
