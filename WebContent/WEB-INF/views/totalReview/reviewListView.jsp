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
					<p>검색 결과 <span>${ reviewList.size() }</span>개</p>
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
				<ul class="result_list">
				<c:choose>
					<c:when test="${ reviewList.size() == 0 }">
					<li>아직 등록된 리뷰가 없습니다.</li>
					</c:when>
					<c:otherwise>
					<c:forEach var="r" items="${ reviewList }">
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
								<div class="star_rating_warpper" style="width:${ 142/5.0 * r.point }px">
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
								<c:forEach var="option" items="${ r.product.optionList }" end="2">
									<c:if test="${ option.name != 'N' }">
										<li>${ option.name }</li>
									</c:if>
								</c:forEach>
								</ul>
							</div>
						</div>
						<div class="button_area">
							<button type="button" class="detail_button">자세히 보기</button>
							<button type="button" class="green_button buy_button" disabled>이 구성 구매하기</button>
						</div>
					</li>
					</c:forEach>
					</c:otherwise>
				</c:choose>
				</ul>
				<div class="more">
					<button class="green_button more_button">더보기</button>
				</div>
			</div>
		</div>
		<div class="dimmed">
			<div id ="modal">
				<div class="modal_inner">
					<div class="detail_review_inner">
						<div class="image_area">
							<img src="https://via.placeholder.com/428" alt="음식 대표 이미지">
						</div>
						<div class="info_area">
							<div class="star_info">
								<div class="star_base">
									<span class="star"></span>
									<span class="star"></span>
									<span class="star"></span>
									<span class="star"></span>
									<span class="star"></span>
								</div>
								<div class="star_rating_warpper">
									<div class="star_rating">
										<span class="star"></span>
										<span class="star"></span>
										<span class="star"></span>
										<span class="star"></span>
										<span class="star"></span>
									</div>
								</div>
							</div>
							<div class="write_info">
								<p>abcdef123</p>
								<p>2020.07.04</p>
							</div>
							<div class="menu_info">
								<h4>오뎅탕 세트</h4>
								<div class="option_area">
									<button type="button" class="green_button option">옵션 전체 보기</button>
									<div class="option_layer">
										<div>
											<dl>
												<dt>우엉마끼</dt>
												<dd>1</dd>
											</dl>
											<dl>
												<dt>시로볼 아까볼</dt>
												<dd>5</dd>
											</dl>
											<dl>
												<dt>생선 두부 튀김</dt>
												<dd>7</dd>
											</dl>
											<dl>
												<dt>크림치즈 어묵볼</dt>
												<dd>1</dd>
											</dl>
											<dl>
												<dt>우엉마끼</dt>
												<dd>1</dd>
											</dl>
											<dl>
												<dt>시로볼 아까볼</dt>
												<dd>5</dd>
											</dl>
											<dl>
												<dt>생선 두부 튀김</dt>
												<dd>7</dd>
											</dl>
											<dl>
												<dt>크림치즈 어묵볼</dt>
												<dd>1</dd>
											</dl>
										</div>
									</div>
								</div>
							</div>
							<div class="text_review">
								오는 그리워 별 위에도 어머님, 거외다. 벌레는 파란 봄이 위에 너무나 같이 노새, 봅니다. 지나가는 나의 애기 언덕 아름다운 덮어 까닭입니다. 소학교 했던 어머니 그리워 노새, 나의 슬퍼하는 까닭입니다. 내 잔디가 자랑처럼 계집애들의 벌레는 속의 있습니다. 별 했던 가을로 까닭입니다. 딴은 밤이 피어나듯이 부끄러운 너무나 어머님, 슬퍼하는 이름자를 불러 버리었습니다.
								오는 그리워 별 위에도 어머님, 거외다. 벌레는 파란 봄이 위에 너무나 같이 노새, 봅니다. 지나가는 나의 애기 언덕 아름다운 덮어 까닭입니다. 소학교 했던 어머니 그리워 노새, 나의 슬퍼하는 까닭입니다. 내 잔디가 자랑처럼 계집애들의 벌레는 속의 있습니다. 별 했던 가을로 까닭입니다. 딴은 밤이 피어나듯이 부끄러운 너무나 어머님, 슬퍼하는 이름자를 불러 버리었습니다.
							</div>
							<div class="button_area">
								<div>
									<p>리뷰가 맘에 드셨나요?</p>
									<div class="like_area">
										<button class="active">좋아요 해제 버튼</button>
										<span>12</span>
									</div>
								</div>
								<button class="green_button buy_button">이 구성 구매하기</button>
							</div>
						</div>
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