package mvc.model;

public class HugiDTO {

	private int num;			//게시글 순서
	private String name;		//작성자
	private String id;			//아이디
	private String car_image;	//모델 이미지
	private String carModel;	//모델 종류
	private String carname;		//모델 이름
	private String title;		//제목
	private String content;		//내용
	private int count;			//조회수
	private int star;			//별점
	private String u_day;		//등록날짜
	
		
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCar_image() {
		return car_image;
	}
	public void setCar_image(String car_image) {
		this.car_image = car_image;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getU_day() {
		return u_day;
	}
	public void setU_day(String u_day) {
		this.u_day = u_day;
	}
}
