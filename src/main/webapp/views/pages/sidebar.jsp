<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="utf-8">
    <title>그룹웨어</title>

</head>
<jsp:include page="loginBox.jsp"/>
		<jsp:include page="loginBox.jsp"/>
<div class="left_col scroll-view">
	<div class="navbar nav_title" style="border: 0; height:auto">
		<a href="/main.go" class="site_title" style="height:auto"><img src="img/Frans2.png" style="width:200px"></a>
	</div>

	<div class="clearfix"></div>

	<!-- menu profile quick info -->
	<div class="profile clearfix">
		<div class="profile_pic">
			<%-- <c:if test="${fileList.size()>0}"> --%>
				<c:forEach items="${fileList}" var="path">
					<img src="/photo/${path.file_new}" class="img-circle profile_img" />
				</c:forEach>
					<%-- <img src="memberPhoto.do?path=${path.file_new}" class="img-circle profile_img" /> --%>
				<%-- </c:forEach>
			</c:if> --%>
		</div>
		<div class="profile_info">
			<span>Welcome,</span>
			<h2>${sessionScope.emp_name}</h2>
		</div>
	</div>
	<!-- /menu profile quick info -->

	<br />

	<!-- sidebar menu -->
	<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
		<c:if test="${sessionScope.team != '점장'}">
			<div class="menu_section">

				<h3>본사</h3>
				<ul class="nav side-menu">
					<li><a><i class="fa fa-edit"></i> 결재 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="/docFormList.go">문서 서식</a></li>
							<li><a href="/signList.go">결재 문서</a></li>
							<li><a href="/signList_signmem.go">결재자 문서</a></li>
							<li><a href="/signList_refermem.go">참조자 문서</a></li>
						</ul></li>
					<%-- <c:if test="${sessionScope.power < '2' || sessionScope.team == '인사팀'}"> --%>
					<c:if test="${sessionScope.power < '2' || sessionScope.team == '인사팀'}">
						<li><a><i class="fa fa-group"></i> 직원 <span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu">
								<li><a href="/memberList.go">직원 리스트</a></li>
								<li><a href="/memberInfoList.go">팀/직책/직급</a></li>
							</ul></li>
					</c:if>
					<!--                   <li><a href="/calender.go"><i class="fa fa-calendar"></i> 개인 일정 </a>
                   
                  </li>
                  <li><a><i class="fa fa-cog"></i> 시설 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/facilitiesManagerMain.go">시설 관리</a></li>
                      <li><a href="/facilitiesMain.go">시설 일정</a></li>
                      
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bookmark"></i> 게시판 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/noticeList.go">공지사항</a></li>
                      <li><a href="/newMenuList.go">신메뉴 추천 게시판</a></li>
                    </ul>
                  </li> -->
					<li><a href="/subList.go"><i class="fa fa-pencil"></i>구독권</a></li>
					<li><a href="/storeList.go"><i class="fa fa-institution"></i>매장</a></li>
					<li><a href="/menuList.go"><i class="fa fa-cutlery"></i>메뉴</a></li>
					<li><a><i class="fa fa-archive"></i>자재 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="/stockAdd.go">자재 관리</a></li>
							<li><a href="/orderList.go">발주</a></li>
						</ul></li>
					<li><a href="/subStat.go"><i class="fa fa-bar-chart"></i>통계</a></li>
<!-- 				<li><a><i class="fa fa-bar-chart"></i>통계 <span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu">
							<li><a href="fixed_sidebar.html">매출</a></li>
							<li><a href="fixed_footer.html">메뉴</a></li>
							<li><a href="/subStat.go">구독권</a></li>
						</ul></li> -->
				</ul>
			</div>
		</c:if>
		<c:if test="${sessionScope.team == '점장'}">
			<div class="menu_section">
				<h3>매장</h3>
				<ul class="nav side-menu">
					<li><a><i class="fa fa-user"></i> 회원 관리<span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="/userList.go">회원 관리</a></li>
							<li><a href="/subUserList.go">구독 회원</a></li>
						</ul></li>
						
					<li><a><i class="fa fa-shopping-cart"></i> 발주 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="/shopStock.go">자재 관리</a></li>
							<li><a href="/shopOrderList.go">발주 리스트</a></li>
						</ul></li>
						
					<li><a href="/subList.go"><i class="fa fa-pencil"></i>구독권</a></li>
					
					<li><a href="/menuList.go"><i class="fa fa-cutlery"></i>메뉴</a></li>
						
<!-- 					<li><a><i class="fa fa-bar-chart"></i> 통계 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="fixed_sidebar.html">매출</a></li>
							<li><a href="fixed_footer.html">메뉴</a></li>
							<li><a href="/subStat.go">구독권</a></li>
						</ul></li> -->
				</ul>
			</div>
		</c:if>

	</div>
	<!-- /sidebar menu -->

	<!-- /menu footer buttons -->
	<div class="sidebar-footer hidden-small">
		<!-- <a data-toggle="tooltip" data-placement="top" title="Settings">
			<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
		</a>
		<a data-toggle="tooltip" data-placement="top" title="FullScreen">
			<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
		</a>
		<a data-toggle="tooltip" data-placement="top" title="Lock">
			<span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
		</a> -->
		<a data-toggle="tooltip" data-placement="top" title="Logout" href="/memberLogout.do" style="float:right; background: #2A3F54;">
			<span class="glyphicon glyphicon-off" aria-hidden="true"></span>
		</a>
	</div>
	<!-- /menu footer buttons -->
</div>

</html>
