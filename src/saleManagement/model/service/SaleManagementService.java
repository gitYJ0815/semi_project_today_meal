package saleManagement.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.paging.model.vo.PageInfo;
import saleManagement.model.dao.SaleManagementDao;
import saleManagement.model.vo.Receipt;

public class SaleManagementService {
	private SaleManagementDao smd = new SaleManagementDao();

	public Map<String, Object> selectList(int page, Date startDate, Date endDate) {
		Connection conn = getConnection();
		Map<String, Object> map = new HashMap<>();
		int itemCount = smd.getListCount(conn, startDate, endDate);

		PageInfo pi = new PageInfo(page, itemCount, 10, 20);
		List<Receipt> receiptList = smd.selectList(conn, pi, startDate, endDate);
		
		map.put("pi", pi);
		map.put("receiptList", receiptList);

		close(conn);

		return map;
	}


}
