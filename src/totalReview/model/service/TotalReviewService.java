package totalReview.model.service;

import java.sql.Connection;
import java.util.List;

import totalReview.model.dao.TotalReviewDao;
import totalReview.model.vo.Review;

import static common.JDBCTemplate.*;

public class TotalReviewService {
	private TotalReviewDao trd = new TotalReviewDao();
	
	public int getListCount() {
		Connection conn = getConnection();
		int result = trd.getListCount(conn);

		close(conn);
		
		return result;
	}

	public List<Review> selectList(int page) {
		Connection conn = getConnection();
		List<Review> reviewList = trd.selectList(conn, page);
		
		close(conn);
		
		return reviewList;
	}
	
	
}
