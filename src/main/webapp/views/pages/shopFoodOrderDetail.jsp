<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<jsp:include page="css.jsp" />

<style type="text/css">
.orderData{
	display: none;
	
}
.nav_menu {
     margin-bottom: 0;
}

.row > .col-sm-6(0){
	display : none;
}
.dataTables_info{
	display : none;
}
#listButton{
	float: left;
	font-size: 9pt;
}
.row > .col-sm-6:first-child {
      display: none;
   }
   
   #datatable-checkbox{
	text-align: center;
}
</style>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col"><jsp:include page="sidebar.jsp" /></div>

			<!-- top navigation -->
			<div class="top_nav"><jsp:include page="top_nav.jsp" /></div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col addWrap" role="main">

				<div class="x_content">
					<div class="col-md-12 col-sm-12 ">
						<div class="x_panel">
							<div class="x_title"></div>
							<div class="x_content">
								<div class="row">
									<div class="col-sm-12">
										<div class="card-box table-responsive">
											
												<table id="datatable-checkbox"
													class="table table-striped table-bordered bulk_action"
													style="width: 100%">
													<h3>발주내역</h3>
													<h4>${data[0].shop_name}</h4>
													<thead>
														<tr>

															<th>물품명</th>
															<th>매장 재고량</th>
															<th>신청량</th>
															<th>처리상태</th>
														</tr>
													</thead>


													<tbody id="orderList">
														<c:forEach items="${data}" var="list">
															<tr>	
																<td>${list.stock_name}</td>
																	<c:if test="${list.shop_stock_amount eq null}">
																		<td class="shopStock">0개</td>
																	</c:if>
																	<c:if test="${list.shop_stock_amount gt '0'}">
																		<td class="shopStock"><fmt:formatNumber value="${list.shop_stock_amount}" pattern="#,###" />개</td>
																	</c:if>																
																<td><fmt:formatNumber value="${list.order_amount}" pattern="#,###" />개</td>
																
																<td>${list.order_send}</td>
																
															</tr>
														</c:forEach>
													</tbody>
												</table>
												<div>
						
									<button type="button" onclick = "location.href='/shopOrderList.go'" class="btn btn-round btn-secondary"
										id="listButton" value="신청">목록</button>
										</div>
											
										</div>			
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /page content -->
			</div>
		</div>
	</div>
	<jsp:include page="script.jsp" />
</body>
<script>
var shopStock = $(".shopStock");
for(let i = 0; i<shopStock.length; i++){
	if(shopStock[i].innerText == "" || shopStock[i].innerText == null){
		shopStock[i].innerText = 0;
	}
}





	
</script>
</html>