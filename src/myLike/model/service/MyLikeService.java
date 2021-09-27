package myLike.model.service;

import java.sql.Connection;

import static common.JDBCTemplate.*;

import myLike.model.dao.MyLikeDao;

public class MyLikeService {
	private MyLikeDao md = new MyLikeDao();

	public int insertLike(int userNo, int reviewNo) {
		Connection conn = getConnection();
		int result = md.insertLike(conn, userNo, reviewNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);

		return result;
	}

	public int deleteLike(int userNo, int reviewNo) {
		Connection conn = getConnection();
		int result = md.deleteLike(conn, userNo, reviewNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);

		return result;
	}


}
