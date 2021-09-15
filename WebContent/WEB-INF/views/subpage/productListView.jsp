<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 밀</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/subpage/productListView.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div id="container">
		<div class="contents">
			<h2>일식</h2>
			<div class="result_option">
				<ul>
					<li class="active"><a href="#">최신순</a></li>
					<li><a href="#">별점 높은순</a></li>
					<li><a href="#">높은 가격순</a></li>
					<li><a href="#">낮은 가격순</a></li>
				</ul>
			</div>
			<div class="result_list">
				<ul>
					<li class="card sold_out">
						<a href="#">
							<img src="https://via.placeholder.com/260" alt="">
							<div>
								<em>품절</em>
							</div>
						</a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
					<li class="card">
						<a href="#"><img src="https://via.placeholder.com/260" alt=""></a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
					<li class="card">
						<a href="#"><img src="https://via.placeholder.com/260" alt=""></a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
					<li class="card">
						<a href="#"><img src="https://via.placeholder.com/260" alt=""></a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
					<li class="card">
						<a href="#"><img src="https://via.placeholder.com/260" alt=""></a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
					<li class="card">
						<a href="#"><img src="https://via.placeholder.com/260" alt=""></a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
					<li class="card">
						<a href="#"><img src="https://via.placeholder.com/260" alt=""></a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
					<li class="card">
						<a href="#"><img src="https://via.placeholder.com/260" alt=""></a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
					<li class="card">
						<a href="#"><img src="https://via.placeholder.com/260" alt=""></a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
					<li class="card">
						<a href="#"><img src="https://via.placeholder.com/260" alt=""></a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
					<li class="card">
						<a href="#"><img src="https://via.placeholder.com/260" alt=""></a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
					<li class="card">
						<a href="#"><img src="https://via.placeholder.com/260" alt=""></a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
					<li class="card">
						<a href="#"><img src="https://via.placeholder.com/260" alt=""></a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
					<li class="card">
						<a href="#"><img src="https://via.placeholder.com/260" alt=""></a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
					<li class="card">
						<a href="#"><img src="https://via.placeholder.com/260" alt=""></a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
					<li class="card">
						<a href="#"><img src="https://via.placeholder.com/260" alt=""></a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
					<li class="card">
						<a href="#"><img src="https://via.placeholder.com/260" alt=""></a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
					<li class="card">
						<a href="#"><img src="https://via.placeholder.com/260" alt=""></a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
					<li class="card">
						<a href="#"><img src="https://via.placeholder.com/260" alt=""></a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
					<li class="card">
						<a href="#"><img src="https://via.placeholder.com/260" alt=""></a>
						<p>어묵탕 세트</p>
						<p>8,000원</p>
					</li>
				</ul>
			</div>
			<div class="paging">
				<jsp:include page="/WEB-INF/views/common/paging/paging.jsp"/>
			</div>
		</div>
	</div>
</body>
</html>