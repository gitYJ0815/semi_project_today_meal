<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합 리뷰</title>
<link href="<%= request.getContextPath() %>/resources/css/totalReview/reviewListView.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div id="container">
		<div class="result_option">
			<div class="result_option_inner">
				<div>
					<p>전체 리뷰</p>
					<p>검색 결과 <span>${ listCount }</span>개</p>
				</div>
				<div>
					<select>
						<option>최신순</option>
						<option>인기순</option>
						<option>별점 높은순</option>
						<option>높은 가격순</option>
						<option>낮은 가격순</option>
					</select>
				</div>
			</div>
		</div>
		<div class="result_area">
			<div class="filter">
				<div class="filter_inner">
					<h2 class="blind">리뷰 검색</h2>
					<div>
						<input type="text" placeholder="상품명, 내용" class="search_input">
						<button type="button">검색</button>
					</div>
					<div>
						<h3>카테고리</h3>
						<ul class="category">
							<li>
								<input type="checkbox" name="korean_food" id="korean_food">
								<label for="korean_food">한식<span></span></label>
							</li>
							<li>
								<input type="checkbox" name="american_food" id="american_food">
								<label for="american_food">양식<span></span></label>
							</li>
							<li>
								<input type="checkbox" name="chinese_food" id="chinese_food">
								<label for="chinese_food">중식<span></span></label>
							</li>
							<li>
								<input type="checkbox" name="japanese_food" id="japanese_food">
								<label for="japanese_food">일식<span></span></label>
							</li>
							<li>
								<input type="checkbox" name="snack" id="snack">
								<label for="snack">분식<span></span></label>
							</li>
							<li>
								<input type="checkbox" name="midnight_snack" id="midnight_snack">
								<label for="midnight_snack">야식<span></span></label>
							</li>
							<li>
								<input type="checkbox" name="salad" id="salad">
								<label for="salad">샐러드<span></span></label>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="result <c:if test="${ reviewList.size() == 0 }">empty_result</c:if>">
				<form name="reviewListForm" method="post">
					<input type="hidden" id="page" value="1">
					<input type="hidden" id="item_count" value="${ reviewList.size() }">
					<input type="hidden" id="all_item_count" value="${ listCount }">
				</form>
				<ul class="result_list">
				<c:choose>
					<c:when test="${ reviewList.size() == 0 }">
					<li>아직 등록된 리뷰가 없습니다.</li>
					</c:when>
					<c:otherwise>
					<c:forEach var="r" items="${ reviewList }" end="8">
					<li class="card">
						<div class="like_area">
							<button>좋아요 버튼</button>
						</div>
						<div class="image_area">
							<c:choose>
								<c:when test="${ empty r.reviewImagePath }">
									<c:set var="imagePath" value="${ r.product.representationImage }"/>
								</c:when>
								<c:otherwise>
									<c:set var="imagePath" value="${ r.reviewImagePath }"/>
								</c:otherwise>
							</c:choose>
							<img src="${ contextPath }${ imagePath }" alt="리뷰 대표 이미지">
						</div>
						<div class="info_area">
							<div class="star_area">
								<div class="star_base">
									<span class="star"></span>
									<span class="star"></span>
									<span class="star"></span>
									<span class="star"></span>
									<span class="star"></span>
								</div>
								<div class="star_rating_warpper" style="width:${ 24 * r.point + 4 * (r.point - r.point%1) }px">
									<div class="star_rating">
										<span class="star"></span>
										<span class="star"></span>
										<span class="star"></span>
										<span class="star"></span>
										<span class="star"></span>
									</div>
								</div>
							</div>
							<div class="name">${ r.product.pname }</div>
							<div class="price"><fmt:formatNumber value="${ r.sum }" type="number" groupingUsed="true"/></div>
							<div class="option_list">
								<ul>
							<c:if test="${ !empty r.product.optionList }">
								<c:forEach var="option" items="${ r.product.optionList }" end="2">
									<li>${ option.name }</li>
								</c:forEach>
							</c:if>
								</ul>
							</div>
						</div>
						<div class="button_area">
							<button type="button" class="detail_button" data-review-no="${ r.rno }">자세히 보기</button>
							<button type="button" class="green_button buy_button" <c:if test="${ r.status == false }">disabled</c:if>>이 구성 구매하기</button>
						</div>
					</li>
					</c:forEach>
					</c:otherwise>
				</c:choose>
				</ul>
				<div class="more">
					<button class="green_button more_button <c:if test="${ reviewList.size() == listCount }">hidden</c:if>">더보기</button>
				</div>
			</div>
		</div>
		<div class="dimmed">
			<div id ="modal">
				<div class="modal_inner">
					<div class="detail_review_inner">

					</div>
					<div class="cart_inner">
						<h3>장바구니에 담으시겠습니까?</h3>
						<div class="button_area">
							<button type="button" class="green_button">확인</button>
							<button type="button" class="confirm_button">바로구매</button>
						</div>
					</div>
				</div>
				<button type="button" class="close_button"></button>
			</div>
		</div>
	</div>
	<script src="${ contextPath }/resources/js/totalReview/totalReview.js"></script>
</body>
</html>