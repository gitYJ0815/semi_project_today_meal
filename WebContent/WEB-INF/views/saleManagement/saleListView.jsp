<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매관리</title>
<link href="<%= request.getContextPath() %>/resources/css/saleManagement/saleListView.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div id="container">
		<nav class="snb">
			<jsp:include page="/WEB-INF/views/common/adminPage/subMenu.jsp"/>
		</nav>
		<div class="contents">
			<div class="contents_inner">
				<h2>판매 관리</h2>
				<form class="search_area" method="GET">
					<div>
						<div>
							<label for="startYear">기간 : </label>
							<input type="hidden" id="start_date" name="start_date" value="${ startDate.date }">
							<input type="hidden" id="end_date" name="end_date" value="${ endDate.date }">
							<select id="start_year" class="year">
							<c:forEach var="i" begin="0" end="${ startDate.year - 2020 }">
								<option value="${ startDate.year - i }" <c:if test="${ i == 0 }">selected</c:if>>${ startDate.year - i }</option>
							</c:forEach>
							</select>
							<span>년</span>
							<select id="start_month" class="month">
							<c:forEach var="i" begin="1" end="12">
								<option value="${ i }" <c:if test="${ i == startDate.month }">selected</c:if> <c:if test="${ !((startDate.year < today.year) || ( startDate.year == today.year && i <= today.month )) }">disabled</c:if>>${ i }</option>
							</c:forEach>
							</select>
							<span>월</span>
							<select id="start_day">
							<c:forEach var="i" begin="1" end="${ startDate.lastDay }">
								<option value="${ i }" <c:if test="${ i == startDate.day }">selected</c:if> <c:if test="${ !((startDate.year < today.year) || ( startDate.year == today.year && startDate.month < today.month) || (startDate.year == today.year && startDate.month <= today.month && i <= today.day)) }">disabled</c:if>>${ i }</option>
							</c:forEach>
							</select>
							<span class="except_margin">일</span>
							<span class="except_margin">~</span>
							<select id="end_year" class="year">
								<c:forEach var="i" begin="0" end="${ endDate.year - 2020 }">
									<option value="${ endDate.year - i }" <c:if test="${ i == 0 }">selected</c:if>>${ endDate.year - i }</option>
								</c:forEach>
							</select>
							<span>년</span>
							
							<select id="end_month" class="month">
							<c:forEach var="i" begin="1" end="12">
								<option value="${ i }" <c:if test="${ i == endDate.month }">selected</c:if> <c:if test="${ !((endDate.year < today.year) || ( endDate.year == today.year && i <= today.month )) }">disabled</c:if>>${ i }</option>
							</c:forEach>
							</select>
							<span>월</span>
							<select id="end_day">
							<c:forEach var="i" begin="1" end="${ endDate.lastDay }">
								<option value="${ i }" <c:if test="${ i == endDate.day }">selected</c:if> <c:if test="${ i == endDate.day }">selected</c:if> <c:if test="${ !((endDate.year < today.year) || ( endDate.year == today.year && endDate.month < today.month) || (endDate.year == today.year && endDate.month <= today.month && i <= today.day)) }">disabled</c:if>>${ i }</option>
							</c:forEach>
							</select>
							<span class="except_margin">일</span>
						</div>
						<div>
							<div>
								<label for="id">아이디 :</label>
								<input type="text" name="id" id="id" maxLength="12" placeholder="아이디 입력" value="${ param.id }">
							</div>
							<div>
								<label for="orderNumber">주문 번호 : </label>
								<input type="number" name="orderNumber" id="orderNumber" placeholder="주문번호 입력" value="${ param.orderNumber }">
							</div>
						</div>
					</div>
					<button type="button" class="green_button search_button">검색</button>
				</form>
				<div class="result_area <c:if test="${ receiptList.size() == 0 }">empty_result</c:if>">
					<div class="result_option">
						<input type="checkbox" name="select_all" id="select_all">
						<label for="select_all">전체 선택</label>
						<button type="button" class="green_button" disabled>주문상태 변경</button>
					</div>
					<table>
						<caption class="blind">주문 데이터</caption>
						<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">일자</th>
								<th scope="col">주문번호</th>
								<th scope="col">아이디</th>
								<th scope="col">주문상품 목록</th>
								<th scope="col">결제내역</th>
								<th scope="col">
									<select name="orderStatus">
										<option value="default" selected>주문 상태</option>
										<option value="processing">주문 완료</option>
										<option value="pickup">배송 대기</option>
										<option value="transit">배송중</option>
										<option value="delivered">배송 완료</option>
										<option value="cancelled">취소/환불</option>
									</select>
								</th>
								<th scope="col">상세 보기</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${ receiptList.size() == 0 }">
							<tr>
								<td colspan="8">주문 내역이 없습니다.</td>
							</tr>
							</c:when>
							<c:otherwise>
							<c:forEach var="receipt" items="${ receiptList }">
							<tr>
								<td><input type="checkbox" name="select_row" data-receipt-no="${ receipt.ono }"></td>
								<td><fmt:formatDate value="${ receipt.saleDate }" pattern="yyyy-MM-dd"/></td>
								<td>${ receipt.ono }</td>
								<td>${ receipt.userId }</td>
								<td>${ receipt.product.pname }</td>
								<td><fmt:formatNumber value="${ receipt.orderSum }" type="number" groupingUsed="true"/></td>
								<td>${ receipt.orderState }</td>
								<td><button type="button" class="green_button learn_more_button" data-receipt-no="${ receipt.ono }">상세 보기</button></td>
							</tr>
							</c:forEach>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
					<div class="paging">
						<c:choose>
							<c:when test="${ empty param }">
								<c:set var="addQueryParam" value=""/>
							</c:when>
							<c:otherwise>
								<c:set var="addQueryParam" value="&start_date=${ param.start_date }&end_date=${ param.end_date }&id=${ param.id }&orderNumber=${ param.orderNumber }"/>
							</c:otherwise>
						</c:choose>
						<jsp:include page="/WEB-INF/views/common/paging/paging.jsp">
							<jsp:param name="url" value="${ contextPath }/sale/list?"/>
							<jsp:param name="searchParam" value="${ addQueryParam }"/>
						</jsp:include>
					</div>
				</div>
			</div>
		</div>
		<div class="dimmed">
			<div id ="modal">
				<div class="modal_inner">
					<div class="payment_inner">
						<h3>거래내역</h3>
						<div></div>
						<button type="button" class="green_button check_button">확인</button>
					</div>
					<div class="change_inner">
						<h3>선택한 주문 건을 모두 아래와<br> 같은 주문 상태로 변경하겠습니까?</h3>
						<div class="change_area">
							<p class="prev_status">주문 완료</p>
							<span></span>
							<select name="change_status">
								<option value="default" selected>주문 상태</option>
								<option value="processing">주문 완료</option>
								<option value="pickup">배송 대기</option>
								<option value="transit">배송중</option>
								<option value="delivered">배송 완료</option>
								<option value="cancelled">취소/환불</option>
							</select>
						</div>
						<div class="button_area">
							<button type="button" class="green_button">취소</button>
							<button type="button" class="confirm_button">확인</button>
						</div>
					</div>
				</div>
				<button type="button" class="close_button"></button>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script src="${ contextPath }/resources/js/saleManagement/saleManagement.js"></script>
</body>
</html>