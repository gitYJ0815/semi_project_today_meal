package myLike.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import static common.JDBCTemplate.*;

import subpage.model.dao.ProductDao;

public class MyLikeDao {
	private Properties query = new Properties();

	public MyLikeDao() {
		String fileName = ProductDao.class.getResource("/sql/myLike/myLike-query.xml").getPath();

		try {
			query.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertLike(Connection conn, int userNo, int reviewNo) {
		PreparedStatement pstmt = null;
		String sql = query.getProperty("insertLike");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, reviewNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteLike(Connection conn, int userNo, int reviewNo) {
		PreparedStatement pstmt = null;
		String sql = query.getProperty("deleteLike");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, reviewNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
