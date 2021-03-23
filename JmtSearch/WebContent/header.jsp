<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%
	//로그인시 저장한 sessionId 를 불러온다. 이것의 값이 없으면 비회원으로 처리
	String sessionId = (String)session.getAttribute("sessionId");
%>
    
<!-- header -->
    <header class="header">
        <div class="logo">
            <a href="index.html">
                <img class="logo-img" src="resources/img/JMT-logo-white.png" alt="">
            </a>
        </div>
        <div class="search">
            <div class="search-wrapper">
                <div class="input-holder">
                    <input type="text" class="search-input" placeholder="Type to search" />
                    <button class="search-icon" onclick="searchToggle(this, event);"><span></span></button>
                </div>
                <span class="close" onclick="searchToggle(this, event);"></span>
            </div>
            <div class="detail">
                <div class="row">
                    <div class="col-md-6">
                        <input type="text" class="form-control floating-label" placeholder="지역">
                    </div>
                    <div class="col-md-6">
                        <div class="form-control-wrapper">
                            <input type="text" id="min-date" class="form-control floating-label" placeholder="날짜">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="user-fastmenu">
            <ul class="fastmenu">
                <li><a href=""><span class="menu-text">할인</span></a></li>
                <li><a href=""><span class="menu-text">Best 맛집 리스트</span></a></li>
            </ul>
            <div class="user">
                <button class="usericon">
                    <i class="fas fa-bars" id="left"></i>
                    <i class="fas fa-user-circle" id="right"></i>
                </button>
                <div class="usermenu">
                    <ul>
                    <c:choose>
						<c:when test="${empty sessionId}">
                        	<li><a href="Login.jsp"><span>로그인</span></a></li>
                        	<li><a href="Join.jsp"><span>회원가입</span></a></li>
                        </c:when>
						<c:otherwise>
							<li><a href="Logout.jsp"><span>로그아웃</span></a></li>
							<li><a href="Login.jsp"><span>마이페이지</span></a></li>
						</c:otherwise>					
					</c:choose>
                        <hr>
                        <li><a href=""><span>도움말</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>

