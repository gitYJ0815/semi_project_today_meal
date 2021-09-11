<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아요 목록</title>
<link href="<%= request.getContextPath() %>/resources/css/myLike/myLikeListView.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div id="container">
		<nav class="snb">
			<div class="snb_inner">
				
			</div>
		</nav>
		<div class="contents">
			<div class="contents_inner">
				<h2>나의 좋아요 목록</h2>
				<div class="like_list empty_result">
					<div class="list_header">
						<div>
							<input type="checkbox" name="select_all" id="select_all" disabled>
							<label for="select_all">전체 선택</label>
						</div>
						<button type="button" class="green_button" disabled>선택 삭제</button>
					</div>
					<div class="list_body">
						<p>좋아요한 리뷰가 없습니다.</p>
					</div>
					<div class="paging">
					
					</div>
				</div>
			</div>
		</div>
		<div class="dimmed">
			<div id ="modal">
				<div class="modal_inner">
					<div class="delete_all_inner">
						<h3>선택된 목록을 삭제하시겠습니까?</h3>
						<div class="button_area">
							<button type="button" class="green_button">취소</button>
							<button type="button" class="confirm_button">삭제</button>
						</div>
					</div>
					<div class="delete_inner">
						<h3>해당 목록을 삭제하시겠습니까?</h3>
						<div class="button_area">
							<button type="button" class="green_button">취소</button>
							<button type="button" class="confirm_button">삭제</button>
						</div>
					</div>
					<div class="cart_inner">
						<h3>장바구니에 담으시겠습니까?</h3>
						<div class="button_area">
							<button type="button" class="green_button">취소</button>
							<button type="button" class="confirm_button">바로구매</button>
						</div>
					</div>
				</div>
				<button type="button" class="close_button"></button>
			</div>
		</div>
	</div>
	<script src="${ contextPath }/resources/js/myLike/myLike.js"></script>
</body>
</html>