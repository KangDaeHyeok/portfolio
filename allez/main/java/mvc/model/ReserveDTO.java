package mvc.model;

public class ReserveDTO {
	private int num; //예약순서
	private String id; //아이디
	private String car_name; //시승차량
	private String place; //시승장소
	private String drive_date; //시승날짜
	private String drive_time; //시승시간
	private String image_url; //시승모델
	
	
	
	
	public ReserveDTO() {}
	
	public ReserveDTO(int num, String id, String car_name, String place, String drive_date, String drive_time, String image_url
		) {
		super();
		this.num = num;
		this.id = id;
		this.car_name = car_name;
		this.place = place;
		this.drive_date = drive_date;
		this.drive_time = drive_time;
		this.image_url = image_url;
	}
	
	
	public int getNum() {
		return num;
	}
	public String getId() {
		return id;
	}
	public String getCar_name() {
		return car_name;
	}
	public String getPlace() {
		return place;
	}
	public String getDrive_date() {
		return drive_date;
	}
	public String getDrive_time() {
		return drive_time;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public void setDrive_date(String drive_date) {
		this.drive_date = drive_date;
	}
	public void setDrive_time(String drive_time) {
		this.drive_time = drive_time;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	
	
}
