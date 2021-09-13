<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<p>검색 결과 <span>24</span>개</p>
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
			<div class="result">
				<ul class="result_list">
					<li class="card">
						<div class="like_area">
							<button>좋아요 버튼</button>
						</div>
						<div class="image_area">
							<img src="https://via.placeholder.com/220" alt="리뷰 대표 이미지">
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
							<div class="name">오뎅탕 세트</div>
							<div class="price">25,000원</div>
							<div class="option_list">
								<ul>
									<li>우엉마끼</li>
									<li>시로볼 아까볼</li>
									<li>생성두부튀김</li>
								</ul>
							</div>
						</div>
						<div class="button_area">
							<button type="button" class="detail_button">자세히 보기</button>
							<button type="button" class="green_button buy_button">이 구성 구매하기</button>
						</div>
					</li>
					
					<li class="card">
						<div class="like_area">
							<button>좋아요 버튼</button>
						</div>
						<div class="image_area">
							<img src="https://via.placeholder.com/220" alt="리뷰 대표 이미지">
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
							<div class="name">오뎅탕 세트</div>
							<div class="price">25,000원</div>
							<div class="option_list">
								<ul>
									<li>우엉마끼</li>
								</ul>
							</div>
						</div>
						<div class="button_area">
							<button type="button" class="detail_button">자세히 보기</button>
							<button type="button" class="green_button buy_button" disabled>이 구성 구매하기</button>
						</div>
					</li>
					<li class="card">
						<div class="like_area">
							<button>좋아요 버튼</button>
						</div>
						<div class="image_area">
							<img src="https://via.placeholder.com/220" alt="리뷰 대표 이미지">
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
							<div class="name">오뎅탕 세트</div>
							<div class="price">25,000원</div>
							<div class="option_list">
								<ul>
									<li>우엉마끼</li>
									<li>시로볼 아까볼</li>
									<li>생성두부튀김</li>
								</ul>
							</div>
						</div>
						<div class="button_area">
							<button type="button" class="detail_button">자세히 보기</button>
							<button type="button" class="green_button buy_button">이 구성 구매하기</button>
						</div>
					</li>
					<li class="card">
						<div class="like_area">
							<button>좋아요 버튼</button>
						</div>
						<div class="image_area">
							<img src="https://via.placeholder.com/220" alt="리뷰 대표 이미지">
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
							<div class="name">오뎅탕 세트</div>
							<div class="price">25,000원</div>
							<div class="option_list">
								<ul>
									<li>우엉마끼</li>
									<li>시로볼 아까볼</li>
									<li>생성두부튀김</li>
								</ul>
							</div>
						</div>
						<div class="button_area">
							<button type="button" class="detail_button">자세히 보기</button>
							<button type="button" class="green_button buy_button">이 구성 구매하기</button>
						</div>
					</li>
					<li class="card">
						<div class="like_area">
							<button>좋아요 버튼</button>
						</div>
						<div class="image_area">
							<img src="https://via.placeholder.com/220" alt="리뷰 대표 이미지">
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
							<div class="name">오뎅탕 세트</div>
							<div class="price">25,000원</div>
							<div class="option_list">
								<ul>
									<li>우엉마끼</li>
								</ul>
							</div>
						</div>
						<div class="button_area">
							<button type="button" class="detail_button">자세히 보기</button>
							<button type="button" class="green_button buy_button" disabled>이 구성 구매하기</button>
						</div>
					</li>
					<li class="card">
						<div class="like_area">
							<button>좋아요 버튼</button>
						</div>
						<div class="image_area">
							<img src="https://via.placeholder.com/220" alt="리뷰 대표 이미지">
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
							<div class="name">오뎅탕 세트</div>
							<div class="price">25,000원</div>
							<div class="option_list">
								<ul>
									<li>우엉마끼</li>
									<li>시로볼 아까볼</li>
									<li>생성두부튀김</li>
								</ul>
							</div>
						</div>
						<div class="button_area">
							<button type="button" class="detail_button">자세히 보기</button>
							<button type="button" class="green_button buy_button">이 구성 구매하기</button>
						</div>
					</li>
					<li class="card">
						<div class="like_area">
							<button>좋아요 버튼</button>
						</div>
						<div class="image_area">
							<img src="https://via.placeholder.com/220" alt="리뷰 대표 이미지">
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
							<div class="name">오뎅탕 세트</div>
							<div class="price">25,000원</div>
							<div class="option_list">
								<ul>
									<li>우엉마끼</li>
									<li>시로볼 아까볼</li>
									<li>생성두부튀김</li>
								</ul>
							</div>
						</div>
						<div class="button_area">
							<button type="button" class="detail_button">자세히 보기</button>
							<button type="button" class="green_button buy_button">이 구성 구매하기</button>
						</div>
					</li>
					<li class="card">
						<div class="like_area">
							<button>좋아요 버튼</button>
						</div>
						<div class="image_area">
							<img src="https://via.placeholder.com/220" alt="리뷰 대표 이미지">
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
							<div class="name">오뎅탕 세트</div>
							<div class="price">25,000원</div>
							<div class="option_list">
								<ul>
									<li>우엉마끼</li>
									<li>시로볼 아까볼</li>
									<li>생성두부튀김</li>
								</ul>
							</div>
						</div>
						<div class="button_area">
							<button type="button" class="detail_button">자세히 보기</button>
							<button type="button" class="green_button buy_button">이 구성 구매하기</button>
						</div>
					</li>
					<li class="card">
						<div class="like_area">
							<button>좋아요 버튼</button>
						</div>
						<div class="image_area">
							<img src="https://via.placeholder.com/220" alt="리뷰 대표 이미지">
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
							<div class="name">오뎅탕 세트</div>
							<div class="price">25,000원</div>
							<div class="option_list">
								<ul>
									<li>우엉마끼</li>
									<li>시로볼 아까볼</li>
									<li>생성두부튀김</li>
								</ul>
							</div>
						</div>
						<div class="button_area">
							<button type="button" class="detail_button">자세히 보기</button>
							<button type="button" class="green_button buy_button">이 구성 구매하기</button>
						</div>
					</li>
				</ul>
				<div class="more">
					<button class="green_button more_button">더보기</button>
				</div>
			</div>
		</div>
		<div class="dimmed">
			<div id ="modal">
				<div class="modal_inner">
					
				</div>
				<button type="button" class="close_button"></button>
			</div>
		</div>
	</div>
</body>
</html>