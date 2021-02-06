package com.bookfarm.beans;

import javax.validation.constraints.NotBlank;

public class SearchBean {
	

	@NotBlank
	private String keyword;

	private int board_info_idx;
	
	public SearchBean() {
		// TODO Auto-generated constructor stub
		this.keyword = "-";
	}
	
	public int getBoard_info_idx() {
		return board_info_idx;
	}

	public void setBoard_info_idx(int board_info_idx) {
		this.board_info_idx = board_info_idx;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	
	
	

	
	

}
