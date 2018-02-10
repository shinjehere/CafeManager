/**
 * 
 */
$(function() {
	searchBoard();
	
	$(function(){
		  $("#allCheck").click(function() { 
				 /*      $("#work_div").val("doSearch"); */
				      if ($("#allCheck").prop("checked")) {// 전체선택 체크박스가 체크되어있으면 
				         $("input[type=checkbox]").prop("checked", true); // 모든 checkbox 체크 
				      } else { // 전체선택 체크박스가 체크되어있지 않으면 
				         $("input[type=checkbox]").prop("checked", false); // 모든 checkbox 체크해제
				      }
				   }); // --전체선택Btn closed
		});
});
//엔터검색키
function btnEnter() {
	$('#currentPage').val('1');
	searchBoard();
}
//찾기 에이젝스
 function searchBoard(){
			 var dataform=$('#searchForm').serialize();
				$.ajax({
					url : "ingredient/list",
					data:dataform,
					type: "GET",
				 	 dataType: "JSON", // 일단 지워봄 
					//async:false, //일단 넣어봄
				 	contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success : function(data) {
						console.log(JSON.stringify(data.list));
					 var strs = "";
						if(data.list.length>0){
							var dataTable = $("#boardTable tbody");
							$("#boardTable tbody tr").remove();
							
							for(var i=0; i<data.list.length; i++){
								strs += trMake(data.list[i]);
							}
							$(dataTable).append(strs);
						}else{
							var dataTable = $("#boardTable tbody");
							$("#boardTable tbody tr").remove();
							strs += "<tr><td colspan=7>데이터가 없습니다.</td></tr>";
							$(dataTable).append(strs);
						}
						makePaging(data.paging);
					 
					}, error:function(request,status,error){
					    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					   }
			
			});

	}
	//테이블 네뷰 html 태그 값 입력 스크립트 
 function trMake(data){

			var str = '<tr id="toggle_ing" style="cursor:pointer" onclick="javascript:ing_toggle(\''+data.ing_cd+'\',\''+data.ing_nm+'\',\''+data.ing_price+'\',\''+data.unit_amount+'\',\''+data.ing_unit+'\',\''+data.in_reg_dt+'\',\''+data.in_mod_dt+'\')">';
			 str+="<td><input type='checkbox' id='checkOne' name='checkOne' value='"+data.ing_cd+"'/></td>";
				str += '<td>'+data.ing_cd+'</td>';
				str += '<td>'+data.ing_nm+'</td>';
				str += '<td class="text-right">'+data.ing_price+'원</td>';
				str += '<td class="text-right">'+data.unit_amount+'</td>';
				str += '<td>'+data.ing_unit+'</td>';
				str += '<td>'+data.in_reg_dt+'</td>';
				str += '<td>'+data.in_mod_dt+'</td>';
				str += '<tr><td colspan="8" id="toggle_div'+data.ing_cd+'" style="display: none;"><div></div></td></tr>';
				str += '</tr>';
			return str;	
		}
 //페이지 관련 태그
	function makePaging(paging){
		
		var currentPage = $("#currentPage").val();
		$("#startPage").val(paging.startPage);
		 console.log(paging.startPage);
		$("#endPage").val(paging.endPage);
		console.log(paging.endPage);
		$("#pagination li").remove();
		
		var str = "";
			if(currentPage<2){
				str += '<li><a href="#">&laquo;</a></li>';
			}else{
				str += '<li><a href="#" onclick="clickPaging('+(currentPage-1)+')">&laquo;</a></li>';
			}
			
			for(var i=paging.startPage; i<paging.endPage+1; i++){
				if(currentPage == i){
					str += '<li class="active"><a href="#" onclick="clickPaging('+i+')">'+i+'</a></li>';
				}else{
					str += '<li><a href="#" onclick="clickPaging('+i+')">'+i+'</a></li>';
				}
			}
			if(currentPage<paging.endPage){
				str += '<li><a href="#" onclick="clickPaging('+(currentPage+1)+')">&raquo;</a></li>'
			}else{
			str += '<li><a href="#">&raquo;</a></li>'
			}
		$("#pagination").append(str);
        
	}
	//페이지 클릭버튼
	function clickPaging(currentPage){
		
		$("#currentPage").val(currentPage);
		
	 	$("#pagination li").removeClass("active"); 
		
	 	 searchBoard();
		
	}  
	
	function ing_toggle(ing_cd,ing_nm,ing_price,unit_amount,ing_unit,in_reg_dt,in_mod_dt) {
		console.log(ing_cd+ing_nm+ing_price+unit_amount+ing_unit+in_reg_dt+in_mod_dt);

		
		$('#toggle_div'+ing_cd).html(function() {
			var str="";
			str+=
				"<div class='container'>"+
					"<div class='row text-right'>" +
					'<button type="button" class="btn btn-info" style="margin-top: 10px; margin-bottom: 10px; margin-right: 15px;"' +
					' onclick="javascript:ing_update(\''+ing_cd+'\',\''+ing_nm+'\',\''+ing_price+'\',\''+unit_amount+'\',\''+ing_unit+'\',\''+in_reg_dt+'\',\''+in_mod_dt+'\')">수정</button>' +
					"</div>" +
				"</div>";
			return str;
		});
		$('#toggle_div'+ing_cd).toggle('show')
	}

	function ing_update(ing_cd,ing_nm,ing_price,unit_amount,ing_unit,in_reg_dt,in_mod_dt) {
	
		$('#toggle_div'+ing_cd).html(function() {
			var str="";
			str+="<div class='container'>" +
			"<form class='form-horizontal' name='updateForm' id='updateForm'>" +
				"<div class='form-group' id='form-g'>" +
					"<div class='row'>" +
						"<label class='col-md-2 control-label' for='ing_cd'><strong>원재료코드 :</strong></label>" +
						"<div class='col-md-4'><input type='text' class='form-control' name='ing_cd' id='ing_cd' value="+ing_cd+" readonly></div>" +
						"<label class='col-md-2 control-label' for='ing_nm'><strong>원재료명 :</strong></label>" +
						"<div class='col-md-4'><input type='text' class='form-control' name='ing_nm' id='ing_nm' value="+ing_nm+"></div>" +
					"</div>" +
				"</div>" +
				"<div class='form-group'>" +
					"<div class='row'>" +
						"<label class='col-md-2 control-label' for='ing_price'><strong>원재료단가 :</strong></label>" +
						"<div class='col-md-4'>" +
							"<div class='input-group'>"+
								"<input type='text' class='form-control' name='ing_price' id='ing_price'" +
								'onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;"' +
								" value="+ing_price+"><div class='input-group-addon'>원</div>" +
							"</div>" +
						"</div>"+
					"</div>" +
				"</div>" +
				"<div class='form-group'>" +
					"<div class='row'>" +
					"<label class='col-md-2 control-label' for='unit_amount'><strong>1단위당 용량 :</strong></label>" +
					"<div class='col-md-4'><input type='text' class='form-control' name='unit_amount' id='unit_amount'" +
					'onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;"' +
					" value="+unit_amount+"></div>" +
					"<label class='col-md-2 control-label' for='ing_unit'><strong>용량단위 :</strong></label>" +
					"<div class='col-md-4'><input type='text' class='form-control' name='ing_unit' id='ing_unit' value="+ing_unit+"></div>" +
					"</div>" +
				"</div>" +
				"<div class='form-group'>" +				
					"<div class='row'>" +
						"<label class='col-md-2 control-label' for='in_reg_dt'><strong>등록날짜 :</strong></label>" +
						"<div class='col-md-4'><input type='text' class='form-control' name='in_reg_dt' id='in_reg_dt' value="+in_reg_dt+" disabled></div>" +
						"<label class='col-md-2 control-label' for='in_mod_dt'><strong>수정날짜 :</strong></label>" +
						"<div class='col-md-4'><input type='text' class='form-control' name='in_mod_dt' id='in_mod_dt' value="+in_mod_dt+" disabled></div>" +
					"</div>" +
				"</div>" +
				"</div>" +
			 "</form>" +
			"</div>" +
			"<div class='container'>" +
				"<div class='row text-right' style='border-top: 1px solid #ddd; margin-top: 15px;'>" +
					'<button type="button" class="btn btn-info" style="margin-top: 15px; margin-bottom: 15px;"' +
					' onclick="javascript:ing_update_ok()">저장</button>'+
				'<button type="button" class="btn btn-success"  style="margin-top: 15px; margin-left: 5px; margin-bottom: 15px;" id="toggle_close" onclick="javascript:toggle_close(\''+ing_cd+'\')">닫기</button>' +
				"</div>" +
			"</div>";
			return str;
		});
	}
function toggle_close(data) {

	$('#toggle_div'+data).toggle('hide');	
}

function ing_update_ok() {
	var dataform=$('#updateForm').serialize();
	document.updateForm.action='ingredient/update';
	document.updateForm.method='POST';
	document.updateForm.submit(dataform);
}	
	
function ins_modal() {
	$('#myModal').modal();
}

function modal_insert() {
	var ing_nm=$('#ing_nm').val();
	var ing_price=$('#ing_price').val();
	var unit_amount=$('#unit_amount').val();
	var ing_unit=$('#ing_unit').val();
	console.log(ing_price+":"+ing_nm);
	if(ing_nm != null && ing_nm !="" && ing_price != null && ing_price !="" && unit_amount !=null && unit_amount !="" && ing_unit != null && ing_unit !=""){
		var insert_ok=$("#insert_form").serialize();
		document.insert_form.action='ingredient/insert';
		document.insert_form.method='POST';
		document.insert_form.submit(insert_ok);	
	}else{
		alert("공백을 입력해주세요!");
	}

}

function InpuOnlyNumber(obj) 
{
    if (event.keyCode >= 48 && event.keyCode <= 57) { //숫자키만 입력
        return true;
    } else {
        event.returnValue = false;
    }
}

$(function() {
	$("#delete_ing").click(function() {
		var ingArray=new Array();
		$("input[name=checkOne]:checked").each(function() {
			ingArray.push($(this).attr("value"));
			console.log("포문내부확인:"+ingArray); 
		});
			console.log("배열확인="+ingArray);
			if(ingArray.length == 0){
				alert("삭제할 메뉴를 선택해주세요.");
			}else{
				if(confirm("정말 메뉴를 삭제하시겠습니까?") == true){

					$.ajax({
						url:"ingredient/delete",
						data: JSON.stringify(ingArray),
						type:'DELETE',
						dataType:'JSON',
						contentType : "application/json; charset=UTF-8",
						success: function(data){
							location.href=data.url; 
						},
						error: function(request, status, error){
							alert("code:"+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						}
					});
				}else{
					location.reload(true);
				}
			}
			return false;
		
	}); 
});

function excel_down() {
	var dataform=$('#searchForm').serialize();
	document.searchForm.action="ingredient/sell_excel_down";
	document.searchForm.method="POST";
	document.searchForm.submit(dataform);

}
// 오름 내림 차순으로 정렬하는 javascript
$(function() {
	$('#boardTable tr th span').click(function() {
		attr_value=$(this).attr('value');
		$('#SortValue').remove();
		if(attr_value=='1'){
			var sort=document.createElement("input");
			var data=$(this).attr('data-value');
			sort.setAttribute("type","hidden");
			sort.setAttribute("id","SortValue");
			sort.setAttribute("name","SortValue");
			sort.setAttribute("value",data);
			document.searchForm.appendChild(sort);
			$('#currentPage').val('1');
			var dataform=$('#searchForm').serialize();
			console.log(dataform);
			searchBoard();
			/*$('#SortValue').remove();*/
			var dataPlus=Number(data)+Number(6);
			$(this).attr('value',2); 
			$(this).attr('class','glyphicon glyphicon-sort-by-alphabet');
			$(this).attr('data-value',dataPlus);
		}else{
			var sort=document.createElement("input");
			var data=$(this).attr('data-value');
			sort.setAttribute("type","hidden");
			sort.setAttribute("id","SortValue");
			sort.setAttribute("name","SortValue");
			sort.setAttribute("value",data);
			document.searchForm.appendChild(sort);
			$('#currentPage').val('1');
			var dataform=$('#searchForm').serialize();
			console.log(dataform);
			searchBoard();
			/*$('#SortValue').remove();*/
			var dataIns=Number(data)-Number(6);
			$(this).attr('value',1);
			$(this).attr('class','glyphicon glyphicon-sort-by-alphabet-alt');
			var dataIns=Number(data)-Number(6);
			$(this).attr('data-value',dataIns);
		}
	
	});
});