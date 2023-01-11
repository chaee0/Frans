<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<jsp:include page="css.jsp" />
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col"><jsp:include page="sidebar.jsp" /></div>

			<!-- top navigation -->
			<div class="top_nav"><jsp:include page="top_nav.jsp" /></div>
			<!-- /top navigation -->

			<!-- page content -->
		<div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Users <small>Some examples to get you started</small></h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-secondary" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>직원 리스트 <small>Users</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#">Settings 1</a>
                            <a class="dropdown-item" href="#">Settings 2</a>
                          </div>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  
                  <div class="x_content">
                      <div class="row">
                          <div class="col-sm-12">
                            <div class="card-box table-responsive">
                            
                            <select id="con" onchange="listCall()">
								<option value="all" selected="selected">전체</option>
								<option value="팀">팀</option>
								<option value="직급">직급</option>
								<option value="직책">직책</option>
								<option value="상태">상태</option>
							</select>
										
							<select name="sel" id="sel" onchange="listCall()">
								<c:forEach items="${stateMem}" var="stateMem">
								<option value="상태">${stateMem.emp_state_name}</option>
								</c:forEach>
								<c:forEach items="${dutyMem}" var="dutyMem">
								<option value="직책">${dutyMem.duty_name}</option>
								</c:forEach>
								<c:forEach items="${posMem}" var="posMem">
								<option value="직급">${posMem.pos_name}</option>
								</c:forEach>
								<c:forEach items="${teamMem}" var="teamMem">
								<option value="팀">${teamMem.team_name}</option>
								</c:forEach>
							</select>
                            
                    <table id="datatable" class="table table-striped table-bordered" style="width:100%">
                      <thead>
						<tr>
							<th>이름</th>
							<th>아이디</th>
							<th>팀</th>
							<th>직책</th>
							<th>직급</th>
							<th>상태</th>
						</tr>
					  </thead>
					  <tbody id="list">
<%-- 						<c:if test="${list eq null || list eq ''}"> --%>
<!-- 						<tr><td colspan="6">해당 데이터가 존재하지 않습니다.</td></tr> -->
<%-- 						</c:if> --%>
<%-- 						<c:forEach items="${list}" var="member"> --%>
<!-- 							<tr> -->
<%-- 								<td>${member.emp_name}</td> --%>
<%-- 								<td><a href="memberDetail.do?emp_id=${member.emp_id}">${member.emp_id}</a></td> --%>
<%-- 								<td>${member.team_name}</td> --%>
<%-- 								<td>${member.pos_name}</td> --%>
<%-- 								<td>${member.duty_name}</td> --%>
<%-- 								<td>${member.emp_state_name}</td> --%>
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
                      </tbody>
                    </table>
                  </div>
                  </div>
              </div>
            </div>
                </div>
              </div>
              </div>
              </div>
              </div>
          
			<!-- /page content -->

			<!-- footer content -->
			<footer><jsp:include page="footer.jsp" /></footer>
			<!-- /footer content -->
		</div>
	</div>
	<jsp:include page="script.jsp" />
</body>
<script>
listCall();

var sel = $("#sel option:selected").val();
console.log(sel);
var con = $("#con option:selected").val();
console.log(con);

function listCall(){
	$.ajax({
		type:'get',
		url:'/selList.ajax',
		data:{
			'sel': sel.options[sel.selectedIndex].value,
			'con' : con.options[con.selectedIndex].value
			},
		dataType:'JSON',
		success:function(data){
			drawList(data.sel);
		},
		error:function(e){
			console.log(e);
		}
	});
}

function drawList(list){
	var content = '';
	if(list.length>0){
		for(var i=0; i<list.length; i++){
			content += '<tr>';
			content += '<td>'+list[i].emp_name+'</td>';
			content += '<td><a href="memberDetail.do?emp_id='+list[i].emp_id+'">'+list[i].emp_id+'</a></td>';
			content += '<td>'+list[i].team_name+'</a></td>';
			content += '<td>'+list[i].pos_name+'</td>';
			content += '<td>'+list[i].duty_name+'</td>';
			content += '<td>'+list[i].emp_state_name+'</td>';
			content += '</tr>';
		}
	}
	$('#list').empty();
	$('#list').append(content);
}
// <tr>
// <td>${member.emp_name}</td>
// <td><a href="memberDetail.do?emp_id=${member.emp_id}">${member.emp_id}</a></td>
// <td>${member.team_name}</td>
// <td>${member.pos_name}</td>
// <td>${member.duty_name}</td>
// <td>${member.emp_state_name}</td>
// </tr>

</script>
</html>