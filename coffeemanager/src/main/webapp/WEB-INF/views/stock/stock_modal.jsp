<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%-- <script src="${pageContext.request.contextPath}/resources/js/stock/stock_board.js"></script> --%>

<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"  onclick="javascript:reset();">&times;</button>
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
				      <input id="msg" type="text" class="form-control" name="msg">
				    </div>
					<br>
					<!-- 검색 -->
				     <form action="/action_page.php">
					    <div class="input-group  col-xs-12"> 
					   		<span class="input-group-addon">원재료 명</span>
					      	<input type="text" class="form-control search_ingredient" placeholder="Search" name="search">
					     	<div class="input-group-btn"> 
					        <button class="btn btn-default btn-lg search_btn" button type="button" style="height:34px;"><i class="glyphicon glyphicon-search" style="margin-top:-2px;"></i></button>
					      </div> 
					     </div> 
					  </form>
					  <!-- 검색 결과 -->
					<table id="searchTable" class="table table-striped table-bordered table-hover">
						<thead>
					        <tr>
					            <td>원재료 코드</td>
					            <td>원재료명</td>
					            <td>원재료 단가</td>
					            <td>원재료 1단위 용량</td>
					            <td>원재료 단위</td>
					        </tr>
					    </thead>
						<tbody> 
									<!-- 	<select multiple class="form-control" id="sel2">
							 	 <option>1</option>
							     <option>2</option>
							     </select> --> 
			<%-- 			        <c:forEach  var = "iList" items = "${ingredientList }"> 
							       <option>${iList.ing_CD }</option>
							       <option>2</option>
						        </c:forEach>  --%>
						       
						 </tbody>
					</table>
					   
				    <br>
				    
				    <!-- 입고선택  -->
				    	 <div class="form-group">
							<div class="row">
							 	<div class="col-xs-12">
										<div class="input-group">
											<input type="hidden" id="ingredient_cd" ></input>
											<span class="input-group-addon">
											원재료 명 : 
											</span>
											<span class="form-control" id="ingredient_name" ></span>
											<span class="input-group-addon ">
											원재료 단가 : 
											</span>
											<span class="form-control" id="ingredient_price"></span>
											<span class="input-group-addon ">
											원재료 1단위 용량 :
											</span>
											<span class="form-control" id="ingredient_amount"></span>
											<span class="input-group-addon ">
											원재료 단위 :
											</span>
											<span class="form-control" id="ingredient_unit"></span>
											<span class="input-group-addon ">
											수 량 : 
											</span>
											<input class="form-control" id="ingredient_count" type="number" min="0" onchange="totalPrice()">
											<span class="input-group-btn">
												<button type="reset" id="rest_x" onclick="javascript:reset();" class="btn btn-default">X</button>
											</span>
										</div>
								</div>
						</div>
					 </div>	
				    
				  </form>
				  <br>
					  		  
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default save_ingredient" onclick="javascript:saveIngredient();" >저장</button>
			</div>
		</div>
	</div>
</div>

</html>