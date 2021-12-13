# today meal

### 개발기간
          2021.08.06 ~ 2021.10.01
### 팀원
          노승희, 유혜원, 장영재, 황세빈, 황재윤
### 개발환경 
          OS : Windows10
          IDE : Eclipse
          DBMS : Oracle DB - sqldeveloper
          협업도구 : GITHUB
          Language : Java, HTML5, CSS3, Javascript, jQuery, Servlet
          디자인 툴 : Figma
### 프로젝트 시 활용해본 대표 기술
          Servlet / jQuery / Ajax

### 링크
[ERD](https://www.erdcloud.com/d/Pmk7rgYc7SgbgoeJJ)
[피그마](https://www.figma.com/file/2TryVHEbmxdu4EdGAwIfHb/%EC%83%98%ED%94%8C?node-id=0%3A1)

### 구현 기능
+ 마이페이지 <br><br>
![image](https://user-images.githubusercontent.com/83938898/145149409-77422e54-a9d9-4d79-a80b-d3a9a7287a38.png)
  - 최근 1개월 주문 내역 표시
  - 주문상태표현 (주문완료, 배송중, 배송완료)
  - 주문상태에 매치되는 수량 표시
  - 페이지당 3개의 영수건 표시
  - 구매 취소 구현
---
+ 나의 정보 확인 / 수정 <br><br>
![image](https://user-images.githubusercontent.com/83938898/145149668-a2978162-a7bf-4782-9cbf-2367792be1be.png)
![image](https://user-images.githubusercontent.com/83938898/145149692-33b64771-5868-4943-ae06-549a286a1972.png)
![image](https://user-images.githubusercontent.com/83938898/145149722-e1afa5b3-2f3a-418e-bbd6-c6c9382d487f.png)
  - 비밀번호, 연락처, 이메일, 주소, 비밀번호 찾기 질문/답 변경가능
  - 이메일 변경 인증문자 발송 emailjs 활용
  - 주소 변경 postcodify 활용
---
+ 상세 주문 조회 <br><br>
![image](https://user-images.githubusercontent.com/83938898/145150049-10116ddb-52f9-47a9-a1d8-167183c54937.png)
  - 조회기간 선택
  - 페이지당 6개의 영수건 표시
---
+ 재료/날짜 변경 주문 페이지 <br><br>
![image](https://user-images.githubusercontent.com/83938898/145150152-f1d465d9-f0b5-4d4e-a074-b28bd366f2c5.png)
  - 상품정보 표시
  - 선택 가능한 옵션 리스트 모달창으로 표시
  - 선택한 옵션 상품은 ajax를 통해 동적화면으로 표시
  - 날짜선택 datepicker 위젯 활용
---
+ 매출관리 (관리자 모드) <br><br>
![image](https://user-images.githubusercontent.com/83938898/145150091-66b1c01f-6e25-4ecb-84ab-cf1285f6c733.png)
  - 매출 top 5 상품 정보 표시
  - 일자별 & 월별 매출 조회(ajax를 통해 동적 화면으로 표시)
  - 일자별 매출 조회 시 최대 35개의 행 표시
  - 월별 매출 조회 시 최대 12개의 행 표시
