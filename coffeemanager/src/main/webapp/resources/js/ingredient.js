/**
 * 
 */
$(function() {
	searchBoard();
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

			var str = '<tr>';
			 str+="<td><input type='checkbox' id='checkOne' name='checkOne' value='"+data.ing_cd+"'/></td>";
				str += '<td>'+data.ing_cd+'</td>';
				str += '<td>'+data.ing_nm+'</td>';
				str += '<td>'+data.ing_price+'</td>';
				str += '<td>'+data.unit_amount+'</td>';
				str += '<td>'+data.ing_unit+'</td>';
				str += '<td>'+data.in_reg_dt+'</td>';
				str += '<td>'+data.in_mod_dt+'</td>';
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