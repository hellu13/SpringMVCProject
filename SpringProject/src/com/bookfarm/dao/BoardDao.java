package com.bookfarm.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookfarm.beans.ContentBean;
import com.bookfarm.beans.SearchBean;
import com.bookfarm.mapper.BoardMapper;

@Repository
public class BoardDao {
	
	@Autowired
	private BoardMapper boardMapper;
	
	public void addContentInfo(ContentBean writeContentBean) {
		boardMapper.addContentInfo(writeContentBean);
	}
	
	public String getBoardInfoName(int board_info_idx) {
		return boardMapper.getBoardInfoName(board_info_idx);
	}
	
	public List<ContentBean> getContentList(int board_info_idx, RowBounds rowBounds) {
		return boardMapper.getContentList(board_info_idx, rowBounds);
	}
	
	public List<ContentBean> getKeywordContentList(SearchBean searchBoardBean, RowBounds rowBounds) {
		return boardMapper.getKeywordContentList(searchBoardBean, rowBounds);
	}
	
	public ContentBean getContentInfo(int content_idx) {
		return boardMapper.getContentInfo(content_idx);
	}
		
	public void modifyContentInfo(ContentBean modifyContentBean) {
		boardMapper.modifyContentInfo(modifyContentBean);
	}
	
	public void deleteContentInfo(int content_idx) {
		boardMapper.deleteContentInfo(content_idx);
	}
	
	public int getContentCnt(int content_board_idx) {
		return boardMapper.getContentCnt(content_board_idx);
	}
	
	public int getKeywordContentCnt(SearchBean searchBoardBean) {
		return boardMapper.getKeywordContentCnt(searchBoardBean);
	}

}
