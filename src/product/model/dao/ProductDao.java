package product.model.dao;

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

import product.model.vo.Option;
import product.model.vo.Product;

public class ProductDao {
	private Properties query = new Properties();
	
	public ProductDao() {
		String fileName = ProductDao.class.getResource("/sql/product/product-query.xml").getPath();
		
		try {
			query.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 상품 리스트 조회
	public List<Product> selectProductList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Product> productList = new ArrayList<>();
		String sql = query.getProperty("selectProductList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				productList.add(new Product(rset.getInt("product_no"),
											rset.getString("category_name"),
											rset.getString("product_name")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return productList;
	}

	// 상품 목록 카테고리 조회
	public List<Product> selectList(Connection conn, String searchCategory) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Product> productList = new ArrayList<>();
		String sql = query.getProperty("selectCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchCategory);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				productList.add(new Product(rset.getInt("product_no"),
											rset.getString("category_name"),
											rset.getString("product_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return productList;
	}

	
	// 상품 목록 검색어 조회
	public List<Product> selectList(Connection conn, String searchCondition, String searchValue) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Product> productList = new ArrayList<>();
		String sql = query.getProperty("selectProductList");
		
		if(searchCondition.equals("procode")) {
			// 상품번호로 검색할 경우 수행할 sql문으로 변경
			sql = query.getProperty("selectNoList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(searchValue));
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					productList.add(new Product(rset.getInt("product_no"),
												rset.getString("category_name"),
												rset.getString("product_name")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
		} else if(searchCondition.equals("proname")) {
			// 상품명으로 검색할 경우 수행할 sql문으로 변경
			sql = query.getProperty("selectNameList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchValue);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					productList.add(new Product(rset.getInt("product_no"),
												rset.getString("category_name"),
												rset.getString("product_name")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}			
		}
		return productList;
	}


	// 상품 1개 삭제
	public int deleteProduct(Connection conn, int pNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("deleteProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// // 상품 선택 삭제
	public int checkDeleteProduct(Connection conn, String checkArr) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("deleteProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, Integer.parseInt(checkArr));
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 상품 등록
	public int insertProduct(Connection conn, Product p) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("insertProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getpName());
			pstmt.setString(2, p.getpImg());
			pstmt.setInt(3, p.getpPrice());
			pstmt.setString(4, p.getpDetail());
			pstmt.setInt(5, p.getcNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 옵션 타입 insert
	public int insertOptionType(Connection conn, List<String> optionTypeList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("insertOptionType");
		try {
			
			for(int i = 0; i< optionTypeList.size(); i++) {
				String ot = optionTypeList.get(i);
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, ot);
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertOpt(Connection conn, List<Option> optionList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("insertOption");
		
		try {
			
			for(int i =0; i < optionList.size(); i++) {
				Option o = optionList.get(i);
	
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, o.getOptionName());
				pstmt.setInt(2, o.getOptionPrice());
	
				result += pstmt.executeUpdate();
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 상품 1개 조회
	public Product selectProduct(Connection conn, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;
		String sql = query.getProperty("selectProduct");
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				if(count++ < 1) {	// 옵션말고 상품정보는 1번만 출력되게끔 처리
					p = new Product();
					p.setpNo(rset.getInt("product_no"));
					p.setpName(rset.getString("product_name"));
					p.setpImg(rset.getString("product_img"));
					p.setpPrice(rset.getInt("product_price"));
					p.setpDetail(rset.getString("product_detail"));
					p.setcNo(rset.getInt("category_no"));	
				}
				p.getOptionTypeList().add(rset.getString("option_type"));
				/*
				 * OptionType ot = new OptionType();
				 * ot.setOptionType(rset.getString("option_type"));
				 * p.getOptionTypeList().add(ot);
				 */
				
				Option o = new Option();
				o.setOptionName(rset.getString("option_name"));
				o.setOptionPrice(rset.getInt("option_price"));
				p.getOptionList().add(o);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return p;
	}

	// 상품 수정
	public int updateProduct(Connection conn, Product p) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 상품 옵션명 수정
	public int updateOptionType(Connection conn, List<String> optionTypeList) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 상품 옵션값, 옵션가격 수정
	public int updateOpt(Connection conn, List<Option> optionList) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
