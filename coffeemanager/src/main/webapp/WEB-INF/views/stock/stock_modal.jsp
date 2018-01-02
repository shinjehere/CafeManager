<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="${pageContext.request.contextPath}/resources/js/stock/stock_board.js"></script>

<script>

  $(function() {
    getTimeStamp();

 });

function getTimeStamp() {
	var date = new Date();
	var year  = date.getFullYear();
	var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
	var day   = date.getDate();
	if (("" + month).length == 1) { month = "0" + month; }
	if (("" + day).length   == 1) { day   = "0" + day;   }
	var today = year+'-'+month+'-'+day
	$('#now_date').val(today);
	date.setDate('2');


}   



</script>

<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">입고등록</h4>
			</div>
			<div class="modal-body">
				<form>
				    <div class="input-group">
				    <!-- 입고일자 -->
				      <span class="input-group-addon">입고일자</span>
				     <input id="now_date" type="date" class="form-control" name="income_date" > 
				     <!-- 총 단가 -->
				      <span class="input-group-addon">총단가</span>
				      <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
				    </div>
					<br>
					<!-- 검색 -->
				     <form action="/action_page.php">
					    <div class="input-group"> 
					      <input type="text" class="form-control" placeholder="Search" name="search">
					     	<div class="input-group-btn"> 
					        <button class="btn btn-default btn-lg" type="submit" style="height:34px;"><i class="glyphicon glyphicon-search" style="margin-top:-2px;"></i></button>
					      </div> 
					     </div> 
					  </form>
					  <!-- 검색 결과 -->
					
					  <div class="list-group">
						   <a href="#" class="list-group-item">First item</a>
						   <a href="#" class="list-group-item">Second item</a>
						   <a href="#" class="list-group-item">Third item</a>
					  </div>
					
				    <br>
				    
				    <div class="panel panel-default">
					    <div class="panel-heading">Panel Heading</div>
					    <div class="panel-body">Panel Content</div>
					  </div>
				  </form>
				  <br>
					  		  
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">저장</button>
			</div>
		</div>
	</div>
</div>

</html>