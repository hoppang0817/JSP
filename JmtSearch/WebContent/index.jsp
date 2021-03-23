<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
        integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
        crossorigin="anonymous" />
	<!-- css -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    
    <!-- swiper -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

    <!-- 사용자 정의 css -->
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/swiper.css">

	<!-- date css -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/bootstrap-material-design.min.css" />
    <link rel="stylesheet" href="resources/css/bootstrap-material-datetimepicker.css" />
    
    <!-- 구글폰트 -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	
	<!-- script -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.3.min.js"
        integrity="sha256-aaODHAgvwQW1bFOGXMeX+pC4PZIPsvn2h1sArYOhgXQ=" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/ripples.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/material.min.js"></script>
    <script type="text/javascript"
        src="https://rawgit.com/FezVrasta/bootstrap-material-design/master/dist/js/material.min.js"></script>
    <script type="text/javascript" src="http://momentjs.com/downloads/moment-with-locales.min.js"></script>
    
    <script type="text/javascript" src="resources/js/bootstrap-material-datetimepicker.js"></script>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<jsp:include page="header.jsp" />
	<div class="thumbnail-wrapper">
        <div class="thumbnail">
            <img src="resources/img/header.jpg" alt="" class="headerimg">
        </div>
        <div class="title">
            <p>솔직한 리뷰, 믿을 수 있는 평점!</p>
        </div>
    </div>

    <!-- content -->
    <div class="content" style="padding: 38px 0;">
        <div class="contenttitle">
            <h2>Best 평점</h2>
            <a href="">리스트 더보기</a>
        </div>
        <div class="swiper-container">
            <div class="swiper-wrapper">
            <%
            PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM restaurant ORDER BY r_star DESC LIMIT 5";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
            %>
               	<div class="swiper-slide">
               		<a href=""><div><img src="resources/img/<%=rs.getString("img") %>" alt=""></div>
               		<div class="resinfo">
                        <h2><%=rs.getString("name") %></h2>
                        <h4><%=rs.getString("category") %></h4>
                        <div class="starRev">
                        <%
                        double star = Double.valueOf(rs.getString("star"));
                        double count = star/0.5;
                        
                        for (double i = 1; i < 11; i++) {
                        	if (count >= i && i % 2 == 0) {
                       	%>
                        		<span class="starR2 on"></span>
                        <%
                        	}
                        	else if (count >= i && i % 2 == 1) {
                        %>
                        		<span class="starR1 on"></span>
                        <%
                        	}
                        	else {
                        		if (i % 2 == 1) {
                        %>
                        			<span class="starR1"></span>
                        <%
                        		}
                        		else {
                        %>
                        			<span class="starR2"></span>
                        <%
                        		}
                        	}
                        }
                        %>
                        </div>
                        <h5><%=rs.getString("parking") %></h5>
                        <p><%=rs.getString("addr") %></p>
                    </div>
                    </a>
            	</div>
            	<%} %>
            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
            <!-- Add Arrows -->
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </div>
    
    <div class="content" style="padding: 38px 0;">
        <div class="contenttitle">
            <h2>지역별 인기 맛집</h2>
        </div>
        <div>
            <ul class="list">
				<li><a href=""><img alt="" src="resources/img/서울.jpg"><div class="expla"><span>서울 인기 맛집</span><p>"#서울 핫한 맛집"</p></div></a></li>
				<li><a href=""><img alt="" src="resources/img/경기도.jpg"><div class="expla"><span>경기도 인기 맛집</span><p>"#맛집 찾기 쉽다"</p></div></a></li>
				<li><a href=""><img alt="" src="resources/img/강원도.jpg"><div class="expla"><span>강원도 인기 맛집</span><p>"#넓은만큼 맛집 많아"</p></div></a></li>
				<li><a href=""><img alt="" src="resources/img/부산.jpg"><div class="expla"><span>부산 인기 맛집</span><p>"#맛집 살아있는데~"</p></div></a></li>
				<li><a href=""><img alt="" src="resources/img/경상도.jpg"><div class="expla"><span>경상도 인기 맛집</span><p>"#맛집 투어!"</p></div></a></li>
				<li><a href=""><img alt="" src="resources/img/제주.jpg"><div class="expla"><span>제주 인기 맛집</span><p>"#제주도 맛집 여행"</p></div></a></li>
            </ul>
        </div>
    </div>

    <div class="content" style="padding: 38px 0;">
        <div class="contenttitle">
            <h2>메뉴별 인기 맛집</h2>
        </div>
        <div>
            <ul class="list">
				<li><a href=""><img alt="" src="resources/img/한식.jpg"><div class="expla"><span>한식 인기 맛집</span><p>"#너무 맛있는 한식"</p></div></a></li>
				<li><a href=""><img alt="" src="resources/img/일식.jpg"><div class="expla"><span>일식 인기 맛집</span><p>"#돈카츠부터 라멘까지"</p></div></a></li>
				<li><a href=""><img alt="" src="resources/img/양식.jpg"><div class="expla"><span>양식 인기 맛집</span><p>"#고품격 레스토랑"</p></div></a></li>
				<li><a href=""><img alt="" src="resources/img/수제버거.jpg"><div class="expla"><span>수제버거 인기 맛집</span><p>"#육즙 폭발하는 패티"</p></div></a></li>
				<li><a href=""><img alt="" src="resources/img/분식.jpg"><div class="expla"><span>분식 인기 맛집</span><p>"#떡튀순!"</p></div></a></li>
				<li><a href=""><img alt="" src="resources/img/카페.jpg"><div class="expla"><span>인기 카페</span><p>"#분위기 좋은 카페"</p></div></a></li>
            </ul>
        </div>
    </div>
	<%@ include file="footer.jsp" %>
	
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="resources/js/header.js"></script>
    <script src="resources/js/swiper.js"></script>
    <script src="resources/js/DatePicker.js"></script>
</body>
</html>