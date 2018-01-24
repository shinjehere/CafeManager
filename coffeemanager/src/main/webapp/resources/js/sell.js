/**김영섭
 * JSP AJAX파일 이관
 */
	$(function() {
		 searchBoard(); //실행시 ajax list 불러오기 실행
		 $("#searchBtn").click(function() {//검색 찾기버튼
			 btnEnter();
		 });
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
	//search 관련 javascript
	//검색 버튼 및 엔터시 실행된다.
	function btnEnter() {
				$('#currentPage').val('1');
				searchBoard();
}
	/* 토글 관련 javascript */
	/*에이젝스로 값을 보내주고 JSON형식으로 값을 받아옴*/
	/*토글 꾸며주기 완료*/
	function toggle(toggle_value) {
		$.ajax({
			url:"sell/"+toggle_value,
			data:JSON.stringify(toggle_value),
			type:'GET',
			dataType:"JSON",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(data) {
				$('#toggle_div'+toggle_value).html(function() {
					var date=new Date(data.list[0].sell_Date);
					var year=date.getFullYear().toString();
					var month= date.getMonth() + 1;
					var day= date.getDate();
					var hours=date.getHours();
					var minutes=date.getMinutes();
					var sell_Date=year+"-"+month+"-"+day+" "+hours+":"+minutes;
					var str="";
					str+='<div class="container"><div class="row"><div class="col-xs-4 col-md-4"><label for="sell_Date">판매일자 :</label>';
					str+='<div id="sell_Date">'+sell_Date+'</div></div>';
					str+='<div class="col-xs-4 col-md-4"><label for="sell_Name">메뉴 코드 :</label>';
					str+='<div id="sell_Name">'+data.list[0].menu_Name+'</div></div>';
					str+='<div class="col-xs-4 col-md-4"><label for="sell_Code">메뉴 코드 :</label>';
					str+='<div id="sell_Code">'+data.list[0].menu_CD+'</div></div></div>';
					str+='<div class="container"><div class="col-xs-12 col-md-12"><table class="table"><caption>원재료 리스트</caption>';
					str+='<thead><tr><th>순서</th><th>원재료 명</th><th>원재료 코드</th><th>사용 용량</th></tr></thead>'
					str+='<tbody>';
					for(var i=0;i<data.list.length;i++){
					str+='<tr>';
					str+='<th scope="row">'+(i+1)+'</th>';
					str+='<td>'+data.list[i].ing_NM+'</td>';
					str+='<td>'+data.list[i].ing_CD+'</td>';
					str+='<td>'+(data.list[i].menu_Amount*data.list[0].sell_CNT)+'</td>';
					str+='</tr>';
					}
					str+='</tbody>';
					return str;
				});
				$('#toggle_div'+toggle_value).toggle('show')
				
				
				var list=JSON.stringify(data.list);
				console.log("success"+JSON.stringify(data.list));
				console.log("success"+data.list);
				
			}
		});
	}
	 function searchBoard(){
	
		 var startdate=$('#startDate').val();
		 var enddate=$('#endDate').val();
		 var stdate=new Date(startdate);
		 stdate.setDate(stdate.getDate()+1);
			var year=stdate.getFullYear().toString();
			var month= stdate.getMonth() + 1;
			var day= stdate.getDate();
			if(month<10){
				month="0"+month;
			}
			if(day<10){
				day="0"+day;
			}
			var Str_plus=year+"-"+month+"-"+day;
		 console.log("startdate:"+startdate+",enddate:"+enddate+",stdate:"+Str_plus);
		 if(startdate > enddate){
			 alert("시작일자가 종료일자보다 클 수 없습니다.")
			 $("#endDate").val(Str_plus);
			 $("#endDate").text(Str_plus);
			 var dataform=$('#searchForm').serialize();
				$.ajax({
					url : "sell/sell",
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
		 }else{
			 var dataform=$('#searchForm').serialize();
			$.ajax({
					url : "sell/sell",
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
				
		
	}
	 function trMake(data){
			var date=new Date(data.sell_Date);
			var year=date.getFullYear().toString();
			var month= date.getMonth() + 1;
			var day= date.getDate();
			var hours=date.getHours();
			var minutes=date.getMinutes();
			var sell_Date=year+"-"+month+"-"+day+" "+hours+":"+minutes;
			var str = '<tr>';
			 str+="<td><input type='checkbox' id='checkOne' name='checkOne' value='"+data.sell_CD+"'/></td>";
				str += '<td><a class="sell_CD" href="#" onclick="javascript:toggle(\''+data.sell_CD+'\')">'+data.sell_CD+'</a></td>';
				str += '<td>'+sell_Date+'</td>';
				str += '<td>'+data.menu_CD+'</td>';
				str += '<td>'+data.menu_Name+'</td>';
				str += '<td>'+data.sell_CNT+'</td>';
				str += '<td>'+data.total_SP+'</td>';
				str += '</tr>';
				str += '<tr><td colspan="6" id="toggle_div'+data.sell_CD+'" style="display: none;"><div></div></td></tr>';
			return str;	
		}
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
	
	function clickPaging(currentPage){
		
		$("#currentPage").val(currentPage);
		
	 	$("#pagination li").removeClass("active"); 
		
	 	 searchBoard();
		
	} 
	function todayTime() {
		var date=new Date();
		var year=date.getFullYear().toString();
		var month= date.getMonth() + 1;
		var day= date.getDate();
		var hours=date.getHours();
		var minutes=date.getMinutes();
		var Time=year+"-"+month+"-"+day+" "+hours+":"+minutes;
		console.log(Time);
		return Time;
	}
	
	function new_sell() {
		$('#myModal').modal();
		serverTime.innerHTML=todayTime(); 
	}
	function menu_SH() {
		var search_text=$('#menu_search').val();
		console.log(search_text);
		$.ajax({
			url:"sell/menuSearch",
			data:{"search_text":search_text},
			type:'GET',
			dataType:"JSON",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(data) {
				console.log(data);
				
					/* console.log(data.list[i].menu_cd); */
					$('#menu_table tbody').html(function() {
						str="";
						for(var i=0;i<data.list.length;i++){
							str+="<tr>";
							str+="<td>"+data.list[i].menu_name+"</td>";
							str+="<td>"+data.list[i].menu_cd+"</td>";
							str+="<td>"+data.list[i].menu_sp+"</td>";
							str+="</tr>";
						}
					
						return str;
					
						});
						trClick()
			},
			error: function(xhr,status,error){
		          //에러!
		          alert("code:"+xhr.status);
		     }
		});
	}
	//테이블 row 클릭시 값 가져오기
	function trClick() {
		$("#menu_table tr").click(function() {
			var tdArr = new Array();
			var tr=$(this);
			var td=tr.children();
			console.log("클릭한 Row의 모든 데이터 : "+tr.text());
			
			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});
			console.log("배열에 담긴 값 : "+tdArr);
			
			var menu_name=td.eq(0).text();
			var menu_cd=td.eq(1).text();
			var menu_sp=td.eq(2).text();
			$('#menu_click_name').text(menu_name);
			$('#menu_click_SP').text(menu_sp);
			$('#menu_click_code').text(menu_cd);
			
		});
	}
	function SP_multiply() {
		var menuName=$('#menu_click_name').text();
		if(menuName=="메뉴이름"){
			alert("메뉴를 검색 후 클릭해 주세요!");
		}else{
			var click_sp=$('#menu_click_SP').text();
			console.log(click_sp);
			var menuCount=$('#menuCount').val();
			if(menuCount==""){
				alert("수량를 입력해주세요");
			}else if(menuCount=="0"){
				alert("0개 입니다");
				$('#sp_click').text(null);
				$('#total_SPay').text(null);
		}else{
				var sp_multiply=click_sp*menuCount;
				console.log(sp_multiply);
				$('#sp_click').text(sp_multiply);
				$('#total_SPay').text(sp_multiply);
				
			}
		}
	}
	function reset() {
		$('#sp_click').text(null);
		$('#total_SPay').text(null);
		$('#menu_click_name').text(null);
		$('#menu_click_SP').text(null);
		$('#menu_click_code').text(null);
	}
	function save_sell() {
		var click_sp=$('#menu_click_SP').text();
		var click_code=$('#menu_click_code').text();
		var click_count=$('#menuCount').val();
		console.log(click_count+":"+click_code)
		if(click_sp==""||click_code==""||click_count==""||click_count=="0"){
			alert("메뉴를 설정해주세요");
		}else{
		$.ajax({
			url:'sell/new',
			data:{"click_code":click_code,"click_count":click_count},
			type:'POST',
			dataType:'JSON',
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(data) {
				location.href=data.url;
				searchBoard();
				console.log(data.url);
			}
		});
		}
	}

$(function() {
	$("#delete_Sell").click(function() {
		var sellCDArray=new Array();
		$("input[name=checkOne]:checked").each(function() {
			sellCDArray.push($(this).attr("value"));
			console.log("포문내부확인:"+sellCDArray); 
		});
			console.log("배열확인="+sellCDArray);
			if(sellCDArray.length == 0){
				alert("삭제할 메뉴를 선택해주세요.");
			}else{
				if(confirm("정말 메뉴를 삭제하시겠습니까?") == true){
			
					$.ajax({
						url:"sell/sellDel",
						data: JSON.stringify(sellCDArray),
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
