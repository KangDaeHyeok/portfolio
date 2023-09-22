package mvc.model;

import java.sql.Timestamp;

public class BoardDTO {
	private int num;
	private String writer;
	private String subject;
	private String content;
	private Timestamp regist_day;
	private int hit;
	private int reF;
	private int reStep;
	private int reLevel;
	private String id;
	
	public BoardDTO(int num, String writer, String subject, String content, Timestamp regist_day, int hit, int reF,
			int reStep, int reLevel, String id) {
		super();
		this.num = num;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.regist_day = regist_day;
		this.hit = hit;
		this.reF = reF;
		this.reStep = reStep;
		this.reLevel = reLevel;
		this.id = id;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegist_day() {
		return regist_day;
	}

	public void setRegist_day(Timestamp regist_day) {
		this.regist_day = regist_day;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getReF() {
		return reF;
	}

	public void setReF(int reF) {
		this.reF = reF;
	}

	public int getReStep() {
		return reStep;
	}

	public void setReStep(int reStep) {
		this.reStep = reStep;
	}

	public int getReLevel() {
		return reLevel;
	}

	public void setReLevel(int reLevel) {
		this.reLevel = reLevel;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	
	
	
	
	
}
