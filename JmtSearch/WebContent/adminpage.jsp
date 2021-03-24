<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="chart.ChartDAO"%>
<%
	ChartDAO dao = new ChartDAO();
	int total_men = dao.num();
	int total_women= dao.wnum();
	int addrnum = dao.addrnum();
	int addrnum1 = dao.addrnum1();
	int addrnum2 = dao.addrnum2();
	int addrnum3 = dao.addrnum3();
	int total_cnt = dao.visitnum();
	int today_cnt = dao.visitTodayeNum();
%>
<!DOCTYPE html>
<html>
  <head>
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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      google.charts.setOnLoadCallback(drawChart1);
      google.charts.setOnLoadCallback(drawChart2);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['남', <%=total_men%>],
          ['여', <%=total_women%>]
        ]);

        var options = {
          title: '가입자 비율(성별)'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
      
      
      function drawChart1() {

          var data1 = google.visualization.arrayToDataTable([
            ['Task', 'Hours per Day'],
            ['서울', <%=addrnum1%>],
            ['경기', <%=addrnum%>],
            ['부산', <%=addrnum2%>],
            ['기타', <%=addrnum3%>]
           
          ]);

          var options1 = {
            title: '가입자 비율(지역)'
          };

          var chart1 = new google.visualization.PieChart(document.getElementById('piechart1'));

          chart1.draw(data1, options1);
        }
      
      function drawChart2() {
          var data = google.visualization.arrayToDataTable([
            ["Element", "Density", { role: "style" } ],
            ["총 방문자 수", <%=total_cnt%>, "#b87333"],
            ["오늘 방문자 수",<%=today_cnt%>, "gold"]
          ]);

          var view = new google.visualization.DataView(data);
          view.setColumns([0, 1,
                           { calc: "stringify",
                             sourceColumn: 1,
                             type: "string",
                             role: "annotation" },
                           2]);

          var options = {
            title: "방문자수",
            width: 1000,
            height: 400,
            bar: {groupWidth: "95%"},
            legend: { position: "none" },
          };
          var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
          chart.draw(view, options);
      }
    
    </script>
  </head>
  <body>
	<jsp:include page="header.jsp" />
	 <table class="columns" style="margin-top: 70px;">
	 <tr class="text-right">
	 	<td></td>
		<td><button class="btn btn-lg btn-primary" type="submit">상점 등록</button><a class="btn btn-lg btn-primary" href="AdminLogout.jsp">로그아웃</a>
	
	 </tr>
      <tr>
       <td><div id="barchart_values" style="width: 900px; height: 300px;"></div></td>
      </tr>
      <tr>
      	 <td><div id="piechart" style="width: 900px; height: 500px;"></div></td>
        <td><div id="piechart1" style="width: 900px; height: 500px;"></div></td>
      </tr>
    </table>

    <%@ include file="footer.jsp" %>
	
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="resources/js/header.js"></script>
    <script src="resources/js/swiper.js"></script>
    <script src="resources/js/DatePicker.js"></script>
  </body>
</html>