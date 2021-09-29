package saleManagement.controller;

import java.io.IOException;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import saleManagement.model.service.SaleManagementService;

/**
 * Servlet implementation class saleListServlet
 */
@WebServlet("/sale/list")
public class saleListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public saleListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 1;
		Date today = (new GregorianCalendar()).getTime();

		Date startDate = today;
		Date endDate = today;
		
		Map<String, Object> map = new SaleManagementService().selectList(page, startDate, endDate);

		request.setAttribute("pi", map.get("pi"));
		request.setAttribute("receiptList", map.get("receiptList"));
		request.getRequestDispatcher("/WEB-INF/views/saleManagement/saleListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
