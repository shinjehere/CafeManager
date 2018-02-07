<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cafe Manager</title>
<!-- Bootstrap -->
<script type="text/javascript" src="/coffee/resources/js/ingredient.js"></script>
<link href="resources/dist/css/bootstrap.css" rel="stylesheet"/>
<link href="resources/dist/css/bootstrap.min.css" rel="stylesheet"/>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="resources/dist/js/jquery-3.2.1.js"></script>
<script src="resources/dist/js/jquery-3.2.1.min.js"></script>
<script src="resources/dist/js/bootstrap.js"></script>
<script src="resources/dist/js/bootstrap.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<div class="container">
	<div class="container">
			<h3>
				<span class="glyphicon glyphicon-book" aria-hidden="true"></span>
				원재료 관리
			</h3>
			<div style="margin-bottom: 10px;"></div>
	</div>		
	<div class="container">
			<form class="form-inline" id="searchForm" name="searchForm">
			<input  type="hidden" id="currentPage" name="currentPage" value="1">
				<div class="col-md-6">
						<div class="form-group">
							<label for="seachCodeAndName">검색 : </label>
							<div class="btn-group">
								<select id="searchDiv" class="btn btn-default"
									data-toggle="dropdown" name="searchDiv">
									<option value="1"
										
										selected>원재료명</option>
		
									<option value="2">원재료코드</option>
								</select>
		
							</div>
							<input type="text"
								class="form-control" id="searchValue" name="searchValue"
								onkeypress="if(event.keyCode==13) {btnEnter(); return false;}"
								placeholder="Search">
								<!--
								HTML onkeypress="if(event.keyCode==13) {btnEnter();return false;}"
								 엔터키 시  btnEnter로 넘긴다. return false없으면 엔터시 주소값을 넘김 -->
							<button id="searchBtn" class="btn btn-success" type="button" onclick="javascript:btnEnter()">Search</button>
						</div>
				</div>
				 <div class='col-md-6'>
				    <div class="row">
						<!-- <div class="form-group">
							검색 기간 :
							            <input type='text' class="form-control" name="startDate" id='startDate' />
										~		
										<input type='text' class="form-control" name="endDate" id='endDate' />
						</div> -->
					</div>
				</div>		
			</form>
		
	<div class="col-lg-12 col-xs-12 col-md-12">
		<table class="table table-hover" id="boardTable">
			<thead>
					<tr>
						<th><input type="checkbox" id="allCheck" /></th>
						<!-- 체크박스 -->
						<th>원재료코드</th>
						<th>원재료명</th>
						<th>원재료단가</th>
						<th>1단위별 용량</th>
						<th>용량단위</th>
						<th>원재료등록날짜</th>
						<th>수정날짜</th>
					</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>

 </div>	
		<div class="text-center">
					<ul class="pagination" id="pagination">
					</ul>
		</div>
		<div class="text-right">
			<div class="btn-group">
					<button type="button" class="btn btn-primary" id="delete_Sell">삭제</button>
					<button type="button" class="btn btn-danger" onclick="javascript:excel_down()">엑셀 다운로드</button>
					<button id="new_sell" type="button" class="btn btn-info"
					onclick="javascript:ins_modal()">신규등록</button>
			</div>
		</div>	 
</div>	

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">신규등록</h4>
		      </div>
		      <div class="modal-body">
		      <div class='container-fluid'>
				<form class='form-horizontal' id="insert_form" name="insert_form">
					<div class='form-group'>
						<div class='row'>
							<label class='col-md-2 control-label' for='ing_nm'><strong>원재료명 :</strong></label>
							<div class='col-md-4'>
									<input type='text' class='form-control' name='ing_nm' id='ing_nm'>
							</div>
							<label class='col-md-2 control-label' for='ing_price'><strong>원재료단가 :</strong></label>
							<div class='col-md-4'>	
								<div class='input-group'>
									<input type='text' class='form-control' name='ing_price' id='ing_price'>
									<div class='input-group-addon'>원</div>
								</div>
							</div>
						</div>
					</div>
					<div class='form-group'>
						<div class='row'>
							<label class='col-md-2 control-label' for='unit_amount'><strong>1단위당 용량 :</strong></label>
							<div class='col-md-4'><input type='text' class='form-control' name='unit_amount' id='unit_amount'></div>
							<label class='col-md-2 control-label' for='ing_unit'><strong>용량단위 :</strong></label>
							<div class='col-md-4'><input type='text' class='form-control' name='ing_unit' id='ing_unit'></div>
						</div>
					</div>
				 </form>
				</div>
			</div>
		       <div class="modal-footer">
		       		        <button type="button" class="btn btn-primary" onclick="javascript:modal_insert()">저장</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		      </div>
		      	 
		</div>
	</div>
</div>		      
	<div style="margin-bottom: 30px;"></div>	
</body>
</html>