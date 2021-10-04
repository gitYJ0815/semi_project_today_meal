package productSelect.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import productSelect.model.vo.OptionBasket;
import productSelect.model.vo.OrderBasket;
import salesAnalysis.model.dao.ReceiptDao;
public class ProductSelectDao {
	
	private Properties query = new Properties();
	
	public ProductSelectDao() {
		String fileName = ReceiptDao.class.getResource("/sql/productSelect/productSelect-query.xml").getPath();
		try {
			query.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public OrderBasket selectProduct(Connection conn, int product_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = query.getProperty("selectProduct");
		OrderBasket ob = null;
		List<OptionBasket> optionBasketList = new ArrayList<>();
		int optCnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, product_no);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				if(rset.getInt("option_count") == 0) {
					ob = new OrderBasket(rset.getString("product_name"),
										 rset.getString("product_img"),
										 rset.getInt("product_price"));
				} else {
					optCnt++;
					optionBasketList.add(new OptionBasket(rset.getString("option_name"),
														  rset.getInt("option_price")));
				}
				
				if(rset.getInt("option_count") == optCnt) {
					ob = new OrderBasket(rset.getString("product_name"),
										 rset.getString("product_img"),
										 rset.getInt("product_price"),
										 optionBasketList);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return ob;
	}
	public OrderBasket selectReview(Connection conn, int rno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		OrderBasket orderBasket = null;
		String sql = query.getProperty("selectReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			pstmt.setInt(2, rno);
			
			rset = pstmt.executeQuery();
			
			int total = 0;
			while(rset.next()) {
				if(orderBasket == null) {
					List<OptionBasket> optionBasketList = new ArrayList<>();
					orderBasket = new OrderBasket(rset.getString("PRODUCT_NAME")
												, rset.getString("PRODUCT_IMG")
												, rset.getInt("PRODUCT_PRICE")
												, optionBasketList);
					total += rset.getInt("PRODUCT_PRICE");
				}
				
				orderBasket.getOptionBasketList().add(new OptionBasket(rset.getString("OPTION_NAME")
																	 , rset.getInt("OPTION_BUY_QUANTITY")
																	 , rset.getInt("OPTION_PRICE")));
				if(rset.getInt("OPTION_BUY_QUANTITY") > 0) {
					total += rset.getInt("OPTION_PRICE") * rset.getInt("OPTION_BUY_QUANTITY");	
				}
			}
			orderBasket.setTotal(total);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return orderBasket;
	}

}
