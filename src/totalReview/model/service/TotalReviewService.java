package totalReview.model.service;

import java.sql.Connection;
import java.util.List;

import totalReview.model.dao.TotalReviewDao;
import totalReview.model.vo.Review;

import static common.JDBCTemplate.*;

public class TotalReviewService {
	private TotalReviewDao trd = new TotalReviewDao();

	public List<Review> selectList() {
		Connection conn = getConnection();
		List<Review> reviewList = trd.selectList(conn);
		
		close(conn);
		
		return reviewList;
	}
	
	
}
