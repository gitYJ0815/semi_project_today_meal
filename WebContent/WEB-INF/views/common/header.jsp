<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="login.model.vo.Member, login.model.dao.MemberDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link href="<%= request.getContextPath() %>/resources/css/common/reset.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/css/common/header.css?ver=1.9" rel="stylesheet">
<% if(session.getAttribute("msg") != null) { %>
<script>
    alert('<%= session.getAttribute("msg")%>');
</script>
<%
        session.removeAttribute("msg"); 
    }
%>
</head>
<body>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<div class="wrapper">
    <header id="header">
        <a href="<%= request.getContextPath() %>">
        <img class="Logo" src="<%= request.getContextPath() %>/resources/images/common/header/logo.png" alt="TM HOME">
        </a>
        <form method="get" action="${ contextPath }/search/list">
           <div class="search">
             <input id="searchBox" name="searchBox" type="text" placeholder="검색어를 입력해주세요.">
             <button id="searchBtn">검색</button>
           </div>
        </form>
        <div class="btnArea">
            <% if(loginUser == null ){ %>
            <a href="<%= request.getContextPath() %>/login">로그인</a>
            <a href="<%= request.getContextPath() %>/memberjoin">회원가입</a>
            <a href="<%= request.getContextPath() %>/faq/list">FAQ</a>
            <a href="#">장바구니</a>
            
                    
            <% } else { %>
            <c:if test="${ !empty loginUser && loginUser.userId != 'admin0' }">
            <a href="<%= request.getContextPath() %>/logout">로그아웃</a>
            <a href="<%= request.getContextPath() %>/user/mypage">마이페이지</a>
            <a href="<%= request.getContextPath() %>/faq/list">FAQ</a>
            <a href="#">장바구니</a>
            </c:if>
            <c:if test="${ !empty loginUser && loginUser.userId == 'admin0' }">
			<a href="<%= request.getContextPath() %>/logout">로그아웃</a>
            <a href="<%= request.getContextPath() %>/sale/list">관리자페이지</a>
            <a href="<%= request.getContextPath() %>/faq/list">FAQ</a>
            <a href="#">장바구니</a>
			</c:if>
            <% } %> 
           
          
        </div>
    </header>
    <nav id="nav">
        <ul>
           <li><a href="${ contextPath }/product/list?cno=1">한식</a></li>
           <li><a href="${ contextPath }/product/list?cno=2">양식</a></li>
           <li><a href="${ contextPath }/product/list?cno=3">중식</a></li>
           <li><a href="${ contextPath }/product/list?cno=4">일식</a></li>
           <li><a href="${ contextPath }/product/list?cno=5">분식</a></li>
           <li><a href="${ contextPath }/product/list?cno=6">양식</a></li>
           <li><a href="${ contextPath }/product/list?cno=7">샐러드</a></li>
           <li><a href="${ contextPath }/totalReview/list">리뷰</a></li>
           <li><a href="${ contextPath }/event/list">이벤트</a></li>
        </ul>
    </nav>
</div>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>

Kakao.init('1e8f882bb483b14f8ef45b0c4a808623'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
              var userName = response.properties.nickname;
        	  
        	  console.log("userName", userName);
        	  location.href="<%= request.getContextPath() %>";
          },
          fail: function (error) {
            console.log(error)
          },
        })
        var apiToken = response.access_token;
        console.log("apiToken", apiToken);
      
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }


//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>

</body>
</html>