package event.model.dao;

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

import event.model.vo.Event;

public class EventDao {
	private Properties query = new Properties();
	
	public EventDao() {
		String fileName = EventDao.class.getResource("/sql/event/event-query.xml").getPath();
		try {
			query.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 이벤트 전체 목록 출력
	public List<Event> selectList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Event> eventList = new ArrayList<>();
		String sql = query.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				eventList.add(new Event(rset.getInt("evnet_no"),
										  rset.getString("evnet_title"),
										  rset.getString("content"),
										  rset.getString("term"),
										  rset.getInt("count"),
										  rset.getInt("user_no"),
										  rset.getString("status")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return eventList;
	}

	// 조회수 증가
	public int increaseCount(Connection conn, int eno) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, eno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 이벤트 게시판 글 내용 확인하기
	public Event selectEvent(Connection conn, int eno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Event ev = null;
		String sql = query.getProperty("selectEvent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, eno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ev = new Event(rset.getInt("evnet_no"),
							  rset.getString("evnet_title"),
							  rset.getString("content"),
							  rset.getString("term"),
							  rset.getInt("count"),
							  rset.getInt("user_no"),
							  rset.getString("status"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ev;
	}

	// 이벤트 글 작성하기
	public int insertEvent(Connection conn, Event ev) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("insertEvent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ev.getEvent_title());
			pstmt.setString(2, ev.getContent());
			pstmt.setString(3, ev.getTerm());
			pstmt.setInt(4, ev.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 이벤트 게시글 삭제
	public int deleteEvent(Connection conn, int eno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = query.getProperty("deleteEvent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, eno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//이벤트 수정하기
	public int updateEvent(Connection conn, Event ev) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = query.getProperty("updateEvent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ev.getEvent_title());
			pstmt.setString(2, ev.getContent());
			pstmt.setString(3, ev.getTerm());
			pstmt.setInt(4, ev.getEno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 검색 목록
	public List<Event> selectList(Connection conn, String searchValue) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Event> eventList = new ArrayList<>();
		// 기본 sql문 : 검색과 무관한 전체 요청
		String sql = query.getProperty("selectTitleList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchValue);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				eventList.add(new Event(rset.getInt("EVNET_NO"),
										  rset.getString("EVNET_TITLE"),
										  rset.getString("content"),
										  rset.getString("term"),
										  rset.getInt("count"),
										  rset.getInt("user_no"),
										  rset.getString("status")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return eventList;
	}

}
