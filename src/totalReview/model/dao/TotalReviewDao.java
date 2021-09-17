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

	public List<Review> selectList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Review> reviewList = new ArrayList<>();
		String sql = query.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			int prevReviewNo = 0;
			Product p = null;
			Review r = null;
			List<Option> optionList = null;
			while(rset.next()) {
				int reviewNo = rset.getInt("REVIEW_NO");

				if(prevReviewNo != reviewNo) {
					prevReviewNo = reviewNo;

					if(r != null) {
						p.setOptionList(optionList);
						r.setProduct(p);
						reviewList.add(r);
					}

					p = new Product(rset.getInt("PRODUCT_NO")
								  , rset.getString("PRODUCT_NAME")
								  , rset.getString("PRODUCT_IMG")
								  , rset.getInt("CATEGORY_NO")
								  , "Y"
								  , rset.getInt("PRODUCT_QUANTITY")
								  );
		
					r = new Review(reviewNo
							, rset.getInt("ORDER_NO")
							, rset.getFloat("POINT")
							, rset.getString("REVIEW_TEXT")
							, rset.getString("REVIEW_IMAGE")
							, rset.getDate("REVIEW_REGISTER")
							, rset.getString("USER_ID")
							, rset.getInt("ORDER_SUM")
							);

					optionList = new ArrayList<>();
				}
				
				Option o = new Option(rset.getString("OPTION_NAME")
									, rset.getInt("OPT_QUANTITY")
						   			);
				optionList.add(o);
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
