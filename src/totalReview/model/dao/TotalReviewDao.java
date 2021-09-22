package totalReview.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import static common.JDBCTemplate.*;

import totalReview.model.vo.Option;
import totalReview.model.vo.Product;
import totalReview.model.vo.Review;

public class TotalReviewDao {
	private Properties query = new Properties();

	public TotalReviewDao() {
		String fileName = TotalReviewDao.class.getResource("/sql/totalReview/review-query.xml").getPath();
		
		try {
			query.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Review> selectList(Connection conn, int page) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Review> reviewList = new ArrayList<>();
		String sql = query.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (page-1)*9+1);
			pstmt.setInt(2, page*9);
			
			rset = pstmt.executeQuery();
			
			int prevReviewNo = 0;
			Product p = null;
			Review r = null;
			List<Option> optionList = null;
			boolean status = true;
			while(rset.next()) {
				int reviewNo = rset.getInt("REVIEW_NO");

				if(prevReviewNo != reviewNo) {
					prevReviewNo = reviewNo;

					if(r != null) {
						r.getProduct().setOptionList(optionList);
						r.setStatus(status);
						reviewList.add(r);
						status = true;
					}

					p = new Product(rset.getString("PRODUCT_NAME")
								  , rset.getString("PRODUCT_IMG")
								  , rset.getInt("PRODUCT_BUY_QUANTITY")
								  );
		
					r = new Review(reviewNo
							, rset.getFloat("POINT")
							, rset.getString("REVIEW_IMAGE")
							, rset.getInt("ORDER_SUM")
							, p
							);

					optionList = new ArrayList<>();
					if(p.getBuyQuantity() > rset.getInt("PRODUCT_INVENTORY_QUANTITY")) {
						status = false;
					}
				}
				
				Option o = new Option(rset.getString("OPTION_NAME")
									, rset.getInt("OPTION_BUY_QUANTITY")
						   			);
				
				if(o.getName() != null) {
					optionList.add(o);
					
					if(o.getBuyQuantity() > rset.getInt("OPTION_INVENTORY_QUANTITY")) {
						status = false;
					}
				}
			}

			if(r != null) {
				p.setOptionList(optionList);
				r.setProduct(p);
				reviewList.add(r);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return reviewList;
	}
}
