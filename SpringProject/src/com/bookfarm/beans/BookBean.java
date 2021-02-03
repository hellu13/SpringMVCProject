package com.bookfarm.beans;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

public class BookBean {

	private int book_idx;

	@NotBlank
	private String book_subject;

	private int book_price;

	@NotBlank
	private String book_rate;

	@NotBlank
	private String book_text;
	private MultipartFile upload_file;
	private String book_file;
	private int book_writer_idx;
	private String book_date;
	private String book_writer_name;

	public int getBook_idx() {
		return book_idx;
	}

	public void setBook_idx(int book_idx) {
		this.book_idx = book_idx;
	}

	public String getBook_subject() {
		return book_subject;
	}

	public void setBook_subject(String book_subject) {
		this.book_subject = book_subject;
	}

	public int getBook_price() {
		return book_price;
	}

	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}

	public String getBook_rate() {
		return book_rate;
	}

	public void setBook_rate(String book_rate) {
		this.book_rate = book_rate;
	}

	public String getBook_text() {
		return book_text;
	}

	public void setBook_text(String book_text) {
		this.book_text = book_text;
	}

	public MultipartFile getUpload_file() {
		return upload_file;
	}

	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}

	public String getBook_file() {
		return book_file;
	}

	public void setBook_file(String book_file) {
		this.book_file = book_file;
	}

	public int getBook_writer_idx() {
		return book_writer_idx;
	}

	public void setBook_writer_idx(int book_writer_idx) {
		this.book_writer_idx = book_writer_idx;
	}

	public String getBook_date() {
		return book_date;
	}

	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}

	public String getBook_writer_name() {
		return book_writer_name;
	}

	public void setBook_writer_name(String book_writer_name) {
		this.book_writer_name = book_writer_name;
	}
	
	

}
