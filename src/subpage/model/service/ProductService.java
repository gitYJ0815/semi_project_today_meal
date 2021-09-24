package subpage.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.model.vo.Product;
import common.paging.model.vo.PageInfo;
import subpage.model.dao.ProductDao;

public class ProductService {
	private ProductDao pd = new ProductDao();
	
	public String selectCategoryName(int cno) {
		Connection conn = getConnection();
		
		String result = pd.selectCategoryName(conn, cno);
		
		close(conn);
		
		return result;
	}

	public Map<String, Object> selectList(int page, int cno, String st) {
		Connection conn = getConnection();
		Map<String, Object> map = new HashMap<>();
		int itemCount = pd.getListCount(conn, cno);
		PageInfo pi = new PageInfo(page, itemCount, 10, 20);
		List<Product> productList = pd.selectList(conn, pi, cno, st);
		
		map.put("pi", pi);
		map.put("productList", productList);
		
		close(conn);
		
		return map;
	}

}
