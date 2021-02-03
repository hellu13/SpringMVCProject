package com.bookfarm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.bookfarm.beans.BookBean;

public interface BookMapper {
	
	@SelectKey(statement = "select book_seq.nextval from dual", keyProperty = "book_idx", before = true, resultType = int.class)
	
	@Insert("insert into book_table(book_idx, book_subject, book_rate, book_price, book_text, book_file, book_writer_idx, book_date) " +
			"values (${book_idx}, #{book_subject}, #{book_rate}, #{book_price}, #{book_text}, #{book_file, jdbcType=VARCHAR}, #{book_writer_idx}, sysdate)")
	void addBookInfo(BookBean writeBookBean);
	
	@Select("select a1.book_idx, a1.book_subject, a1.book_rate, a1.book_price, a2.user_name as book_writer_name " +
			"from book_table a1, user_table a2 " +
			"where a1.book_writer_idx = a2.user_idx " +
			"order by a1.book_idx desc")
	List<BookBean> getBookList();
	
	@Select("select a2.user_name as book_writer_name, "
			+ "to_char(a1.book_date, 'YYYY-MM-DD') as book_date, "
			+ "a1.book_subject, a1.book_rate, a1.book_price, a1.book_text, a1.book_file, a1.book_writer_idx "
			+ "from book_table a1, user_table a2 "
			+ "where a1.book_writer_idx = a2.user_idx and book_idx = #{book_idx}")
	BookBean getBookInfo(int book_idx);
	
	@Update("update book_table " +
			"set book_subject = #{book_subject}, book_rate = #{book_rate}, book_price = #{book_price}, book_text = #{book_text}, book_file = #{book_file, jdbcType=VARCHAR} " +
			"where book_idx = #{book_idx}")
	void modifyBookInfo(BookBean modifyBookBean);
	
	@Delete("delete from book_table " +
			"where book_idx = #{book_idx}")
	void deleteBookInfo(int book_idx);

	
	

}
