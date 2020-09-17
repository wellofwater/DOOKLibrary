package com.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BookVO {

	private String id;
	private String name;
	private int qt;
	private Date regdate;
	private String author;
	private String publisher;
	private String category;
	private String img;
	private String contents;
	private MultipartFile mf;
	private String searchCondition;
	private String searchKeyword;
	
	public BookVO() {
		super();
	}

	public BookVO(String id) {
		super();
		this.id = id;
	}

	

	public BookVO(String name, String author, String publisher) {
		super();
		this.name = name;
		this.author = author;
		this.publisher = publisher;
	}
	
	

	

	public BookVO(String name, String author, String publisher, String img) {
		super();
		this.name = name;
		this.author = author;
		this.publisher = publisher;
		this.img = img;
	}

	public BookVO(String id, String name, String author, String publisher, String img) {
		super();
		this.id = id;
		this.name = name;
		this.author = author;
		this.publisher = publisher;
		this.img = img;
	}
	

	public BookVO(String name, String author, String publisher, String img, MultipartFile mf) {
		super();
		this.name = name;
		this.author = author;
		this.publisher = publisher;
		this.img = img;
		this.mf = mf;
	}

	
	public BookVO(String id, String name, int qt, Date regdate, String author, String publisher, String category,
			String img, String contents) {
		super();
		this.id = id;
		this.name = name;
		this.qt = qt;
		this.regdate = regdate;
		this.author = author;
		this.publisher = publisher;
		this.category = category;
		this.img = img;
		this.contents = contents;
	}

	
	public BookVO(String name, int qt, String author, String publisher, String category, String img, String contents,
			MultipartFile mf) {
		super();
		this.name = name;
		this.qt = qt;
		this.author = author;
		this.publisher = publisher;
		this.category = category;
		this.img = img;
		this.contents = contents;
		this.mf = mf;
	}

	public BookVO(String name, int qt, Date regdate, String author, String publisher, String category, String img,
			String contents, MultipartFile mf) {
		super();
		this.name = name;
		this.qt = qt;
		this.regdate = regdate;
		this.author = author;
		this.publisher = publisher;
		this.category = category;
		this.img = img;
		this.contents = contents;
		this.mf = mf;
	}

	public BookVO(String id, String name, int qt, Date regdate, String author, String publisher, String category,
			String img, String contents,MultipartFile mf) {
		super();
		this.id = id;
		this.name = name;
		this.qt = qt;
		this.regdate = regdate;
		this.author = author;
		this.publisher = publisher;
		this.category = category;
		this.img = img;
		this.contents = contents;
		this.mf = mf;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQt() {
		return qt;
	}

	public void setQt(int qt) {
		this.qt = qt;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	
	public MultipartFile getMf() {
		return mf;
	}

	public void setMf(MultipartFile mf) {
		this.mf = mf;
	}

	
	
	//getter&setter
	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	@Override
	public String toString() {
		return "BookVO [id=" + id + ", name=" + name + ", qt=" + qt + ", regdate=" + regdate + ", author=" + author
				+ ", publisher=" + publisher + ", category=" + category + ", img=" + img + ", contents=" + contents
				+ ", mf=" + mf + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + "]";
	}

	
	

	
	
	
	
}
