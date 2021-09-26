package product.model.service;

import java.sql.Connection;
import java.util.List;

import static common.JDBCTemplate.*;

import product.model.dao.ProductDao;
import product.model.vo.Product;

public class ProductService {
	private ProductDao pd = new ProductDao();

	// 상품 목록 조회
	public List<Product> selectProductList() {
		Connection conn = getConnection();
		
		List<Product> productList = pd.selectProductList(conn);
		
		close(conn);
		
		return productList;
	}

	// 상품 목록 카테고리 조회
	public List<Product> selectProductList(String searchCategory) {
		Connection conn = getConnection();
		
		List<Product> productList = pd.selectList(conn, searchCategory);
		
		close(conn);
		
		return productList;
	}

	
	// 상품 목록 검색어 조회
	public List<Product> selectProductList(String searchCondition, String searchValue) {
		Connection conn = getConnection();
		
		List<Product> productList = pd.selectList(conn, searchCondition, searchValue);
		
		close(conn);
		
		return productList;
	}

	// 상품 1개 삭제
	public int deleteProduct(int pNo) {
		Connection conn = getConnection();
		int result = pd.deleteProduct(conn, pNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	// 상품 선택 삭제
	public int checkDeleteProduct(String[] checkArr) {
		Connection conn = getConnection();
		int result = 0;
		int results = 0;
		
		for(int i = 0; i < checkArr.length; i++) {
			result = pd.checkDeleteProduct(conn, checkArr[i]);
			if(result > 0) {
				results += 1;
			}
		}
		
		if(checkArr.length == results) {	
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return results;
	}

	// 상품 등록
	public int insertProduct(Product p) {
		Connection conn = getConnection();
		
		int result1 = pd.insertProduct(conn, p);
		int result2 = pd.insertOptionType(conn, p.getOptionTypeList());
		int result3 = pd.insertOpt(conn, p.getOptionList());
		
		if(result1 > 0 && result2 == p.getOptionTypeList().size() && result3 == p.getOptionList().size()) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1 > 0 && result2 == p.getOptionTypeList().size() && result3 == p.getOptionList().size() ? 1 : 0;
	}

	// 상품 1개 조회
	public Product selectProduct(int pNo) {
		Connection conn = getConnection();
		
		Product p = pd.selectProduct(conn, pNo);
		
		close(conn);
		
		return p;
	}




	
}
