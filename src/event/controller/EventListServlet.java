package event.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import event.model.service.EventService;
import event.model.vo.Event;


/**
 * Servlet implementation class EventListServelt
 */
@WebServlet("/event/list")
public class EventListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String searchCondition = request.getParameter("searchCondition");
		String searchValue = request.getParameter("searchValue");
		List<Event> eventList;
		
		if(searchCondition != null && searchValue != null) {
			// 검색 된 리스트 조회
			eventList = new EventService().selectList(searchCondition, searchValue);
		} else {
			// 공지사항 게시글에 대한 목록 요청(넘어온 값 없으므로 파라미터 없이 바로 요청)
			eventList = new EventService().selectList();
		}
		
		//System.out.println("공지사항 목록 : " + noticeList);
		request.setAttribute("eventList", eventList);
		
		request.getRequestDispatcher("/WEB-INF/views/event/eventListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
