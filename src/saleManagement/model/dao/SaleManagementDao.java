package saleManagement.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import common.paging.model.vo.PageInfo;
import saleManagement.model.vo.Product;
import saleManagement.model.vo.Receipt;

public class SaleManagementDao {
	private Properties query = new Properties();
	
	public SaleManagementDao() {
		String fileName = SaleManagementDao.class.getResource("/sql/saleManagement/saleManagement-query.xml").getPath();
		
		try {
			query.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getListCount(Connection conn, Date startDate, Date endDate, String userId, String orderNumber) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = query.getProperty("listCount");
		int result = 0;
		
		try {
			int parameterIndex = 1;

			if(userId.equals("")) {
				sql = sql.replace("AND USER_ID = ?", "");
			}
			
			if(orderNumber.equals("")) {
				sql = sql.replace("AND ORDER_NO = ?", "");
			}
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(parameterIndex++, (new java.sql.Date(startDate.getTime())).toString());
			pstmt.setString(parameterIndex++, (new java.sql.Date(endDate.getTime())).toString());
			
			if(!userId.equals("")) {
				pstmt.setString(parameterIndex++, userId);
			}
			
			if(!orderNumber.equals("")) {
				pstmt.setInt(parameterIndex++, Integer.parseInt(orderNumber));
			}
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return result;
	}

	public List<Receipt> selectList(Connection conn, PageInfo pi, Date startDate, Date endDate, String userId, String orderNumber) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Receipt> receiptList = new ArrayList<>();
		String sql = query.getProperty("selectList");

		try {
			int parameterIndex = 1;
			int startItem = (pi.getPage() - 1) * pi.getItemLimit() + 1;
			int endItem = startItem + pi.getItemLimit() - 1;

			if(userId.equals("")) {
				sql = sql.replace("AND USER_ID = ?", "");
			}
			
			if(orderNumber.equals("")) {
				sql = sql.replace("AND ORDER_NO = ?", "");
			}

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(parameterIndex++, (new java.sql.Date(startDate.getTime())).toString());
			pstmt.setString(parameterIndex++, (new java.sql.Date(endDate.getTime())).toString());
			
			if(!userId.equals("")) {
				pstmt.setString(parameterIndex++, userId);
			}
			
			if(!orderNumber.equals("")) {
				pstmt.setInt(parameterIndex++, Integer.parseInt(orderNumber));
			}
			
			pstmt.setInt(parameterIndex++, startItem);
			pstmt.setInt(parameterIndex++, endItem);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product product = new Product(rset.getString("PRODUCT_NAME"));

				Receipt receipt =  new Receipt(rset.getInt("ORDER_NO")
											 , rset.getDate("SALE_DATE")
											 , rset.getInt("ORDER_SUM")
											 , rset.getString("USER_ID")
											 , product
											 , rset.getString("ORDER_STATE_NAME")
											);
				
				receiptList.add(receipt);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return receiptList;
	}

}
