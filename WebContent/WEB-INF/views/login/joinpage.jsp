<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 회원가입</title>
<link href="<%= request.getContextPath() %>/resources/css/common/reset.css" rel="stylesheet">
<style>
.outer{
width:60%;
min-width : 650px;
margin:auto;
margin-top : 10px;
margin-bottom : 50px;
}
.joinArea{
width : 465px;
margin: auto;
padding: 10px;

}
#p1 {
display: flex;
justify-content: center;
align-items: center;


width: 375px;
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 36px;
line-height: 150px;

/* middle green */

color: #406300;
}
#p2 {

width: 115px;
height: 30px;
text-align: left;
margin-bottom: 5px;

padding: 10px 10px 25px 0px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 12px;
line-height: 14px;

color: #000000;
}

span {
color: #FF0000;
}
.input_area input {
display: flex;
justify-content: center;
align-items: center;
margin-top:5px;
width: 375px;
height: 37px;
border: 0px;
/* checkbox gray border color */
border: 1px solid #C4C4C4;
box-sizing: border-box;


}
.joinBtnArea {
width: 200px;
text-align:center;
padding : 50px;
}
	
#joinBtn {
width: 103px;
height: 37px;
border : 0px;
color:white;
background: #A1AD61;
border-radius: 7px;
margin : 5px;
margin-top: 50px;
	}
#postcodify_search_button{
width: 81px;
height: 35px;

/* darkest black */

background: #294401;
border-radius: 7px;
color:white;

margin-top: 30px;
}
#idCheck{
width: 81px;
height: 35px;

/* darkest black */

background: #294401;
border-radius: 7px;
color:white;

margin-top: 30px;
}
#comboBox {

width: 375px;
height: 37px;
border: 0px;
/* checkbox gray border color */
border: 1px solid #C4C4C4;
box-sizing: border-box;
margin-top:5px;

}
</style>
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <div class="wrapper">
       <div class="outer">
            <form class="joinArea" action="<%= request.getContextPath() %>/join" method="post" onsubmit="return validate();">
               <p id="p1">일반 회원가입</p>
               <button id="idCheck" type="button">중복확인</button>
               <p id="p2">아이디
               <span class="input_area">*<input type="text" maxlength="13" name="userId" placeholder="영문 소문자, 숫자 포함 6~12자리" required></span>
               </p>
               
               <p id="p2">비밀번호
               <span class="input_area">*<input type="password" maxlength="15" name="userPwd" placeholder="영문 대소문자, 숫자, 특수문자 포함 8자리 이상" required></span>
               </p>
               
               <p id="p2">비밀번호 확인
               <span class="input_area">*<input type="password" maxlength="15" name="userPwd2" required></span>
               <label id="pwdResult"></label></p>
               
               <p id="p2">이름
               <span class="input_area">*<input type="text" maxlength="5" name="userName" required></span>
               </p>
               
               <p id="p2">연락처
               <span class="input_area">*<input type="tel" maxlength="11" name="phone" placeholder="(-없이)01012345678"></span>
               </p>
               
               <p id="p2">이메일
               <span class="input_area">*<input type="email" name="email"></span>
               </p>
               
               <button id="postcodify_search_button" type="button">검색</button>
               <p id="p2">우편번호
               <span class="input_area">*<input type="text" name="address" class="postcodify_postcode5" readonly></span>
               </p>
               
               <p id="p2">도로명주소
               <span class="input_area">*<input type="text" name="address" class="postcodify_address" readonly></span>
               </p>
               <p id="p2">상세주소
               <span class="input_area">*<input type="text" name="address" class="postcodify_details"></span>
               </p>
               
               <p id="p2">비밀번호 찾기 질문 <span>*
               <select id= "comboBox" name = "Appia">
                  <option value="text" selected>질문을 선택해주세요.</option>
                  <option value="text">졸업한 초등학교는 어디입니까?</option>
                  <option value="text">가장 가고 싶은 여행지는 어디입니까?</option>
                  <option value="text">어릴적 장래희망은 무엇이었습니까?</option>
                  <option value="text">좋아하는 색상은 무슨 색입니까?</option>
                  <option value="text">키워보고 싶은 반려동물은 무엇입니까?</option>
               </select>
               </span>
               </p>
               
               <span class="input_area"><input type="text" name="answer" id="answer" placeholder="답변"></span>
              
               
               <div class="joinBtnArea">
               <button id="joinBtn">가입하기</button>
               </div>
           </form>
        </div>
    </div>
</body>
</html>