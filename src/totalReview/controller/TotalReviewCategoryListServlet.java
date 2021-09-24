package totalReview.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import totalReview.common.TotalReviewCommon;
import totalReview.model.service.TotalReviewService;
import totalReview.model.vo.Review;

/**
 * Servlet implementation class TotalREviewCategoryListServlet
 */
@WebServlet("/totalReview/categoryList")
public class TotalReviewCategoryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TotalReviewCategoryListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int page = 1;
		int listCount = 0;
		TotalReviewService trs = new TotalReviewService();
		
		String categoryParameter = request.getParameter("categoryList");
		List<Integer> categoryNumberList = new ArrayList<>();
		String[] categoryList = null;

		if(categoryParameter != null && categoryParameter.length() > 0) {
			categoryList = categoryParameter.split(",");
			
			for(String category : categoryList) {
				categoryNumberList.add(TotalReviewCommon.CATEGORY_MAP.get(category));
			}
		} else {
			listCount = trs.getListCount(categoryNumberList);
		}

		List<Review> reviewList = trs.selectList(page, categoryNumberList);
		Map<String, Integer> categoryCountMap = new HashMap<>();

		if(categoryList != null) {
			Map<Integer, Integer> categoryCountMapTemp = trs.getCategoryListCount(categoryNumberList);

			for(String category : categoryList) {
				int count = categoryCountMapTemp.get(TotalReviewCommon.CATEGORY_MAP.get(category));

				categoryCountMap.put(category, count);
				listCount += count;
			}
		}

		response.setContentType("application/json; charset=utf-8");
		Gson json = new Gson();
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("listCount", listCount);
		returnMap.put("reviewList", reviewList);
		returnMap.put("categoryCountInfo", categoryCountMap);
		
		json.toJson(returnMap, response.getWriter());
	}

}
