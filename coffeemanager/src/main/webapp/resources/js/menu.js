/*function wrapWindowByMask(){ 
	//화면의 높이와 너비를 구한다. 
	var maskHeight = $(document).height(); 
	var maskWidth = $(window).width(); 
	
	//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다. 
	$('#mask').css({'width':maskWidth,'height':maskHeight}); 
	
	//마스크의 투명도 처리 
	$('#mask').fadeTo("slow",0.8); 
} 

$(document).ready(function(){ 
	//wrapWindowByMask(); 
	//불투명 배경 띄우기 
	$('.openMask').click(function(e){ 
		e.preventDefault(); 
		wrapWindowByMask(); 
	}); 
});

function createNewMenu(){
	$('#newMenu').show();
	wrapWindowByMask();
}

function btnexit(){ 
	$('#newMenu').hide(); 
	$('#mask').hide(); 
}

*/

/*// 신규 등록 팝업 프레임

 * window.open(url:String, name:String, properties:String)
 * open 함수는 반드시 3개의 매개변수가 있어야하고, 순서가 지켜져야 함.
 * 
function createNewMenu() {
	window
			.open("new_menu.jsp", "",
					"width=1300, height=900, left=100, top=50, scrollbars=yes, location=no");
}*/

// 전체선택 체크박스
$(function() {
	$("#allCheck").click(function() {
		$("#work_div").val("doSearch");
		if ($("#allCheck").prop("checked")) {// 전체선택 체크박스가 체크되어있으면
			$("input[id='checkOne']").prop("checked", true); // 모든 checkbox
			// 체크
		} else { // 전체선택 체크박스가 체크되어있지 않으면
			$("input[id='checkOne']").prop("checked", false); // 모든 checkbox
			// 체크해제
		}
	});
});// --전체선택 체크박스 closed

// 메뉴 사용여부 토글
$(function() {
	var tog = $("input[id='tog']");
	tog.click(function() {
		$("p").toggle();
	});
});

// 아코디언 테이블
$(function() {
	var article = (".recruit .show");
	$(".recruit .title  td").click(function() {
		var myArticle = $(this).parents().next("tr");
		if ($(myArticle).hasClass('hide')) {
			$(article).removeClass('show').addClass('hide');
			$(myArticle).removeClass('hide').addClass('show');
		} else {
			$(myArticle).addClass('hide').removeClass('show');
		}
	});
});

/*// datepicker
$(document).ready(function() {
	$("#start_date").datetimepicker({
		format : 'YYYY/MM/DD'
	});

	$("#end_date").datetimepicker({
		format : 'YYYY/MM/DD'
	});
});*/

//=========================================================
// For Paging
//=========================================================

$(function() {
	menuBoard(); 
	$("#searchBtn").click(function() {
		$('#currentPage').val('1');
		menuBoard(); 
	});
});


function makePaging(paging){
	console.log("makePaging");
	
	var currentPage = $("#currentPage").val();
	console.log("currentPage= "+currentPage);
	
	$("#startPage").val(paging.startPage);
	console.log("startPage= "+paging.startPage);
	
	$("#endPage").val(paging.endPage);
	console.log("endPage= "+paging.endPage);
	
	$("#pagination li").remove();
	
	var str = "";
	
		str += '<li><a href="#">&laquo;</a></li>';
		for(var i=paging.startPage; i<paging.endPage+1; i++){
			if(currentPage == i){
				str += '<li class="active"><a href="#" onclick="clickPaging('+i+')">'+i+'</a></li>';
			}else{
				str += '<li><a href="#" onclick="clickPaging('+i+')">'+i+'</a></li>';
			}
		}
		
		str += '<li><a href="#">&raquo;</a></li>'
		
	$("#pagination").append(str);
    
}

function clickPaging(currentPage){
	$("#currentPage").val(currentPage);
	$("#pagination li").removeClass("active");
	menuBoard();
}


//=========================================================
//For Paging closed
//=========================================================


// do_search 검색조회
function menuBoard(){
		var dataform = $("#searchForm").serialize();
	
			// 검색결과(일단 날짜 빼고)
			$.ajax({
				type: "GET",
				url: "menu/menu",
				dataType: "JSON",
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				data: dataform,
				success: function(data){
					
					var datahtml = "";
					
					if(data.list.length>0){
						
						$("#menu_table tbody tr").remove();
						console.log("data size= "+data.list.length);
						for(var i=0; i<data.list.length; i++){
							datahtml += makeData(data.list[i]);
						}
						$('#menu_table tbody').append(datahtml);
					}else{
						$('#menu_table tbody tr').remove();
						datahtml += "<tr><td colspan=7>데이터가 없습니다.</td></tr>"
						$('#menu_table tbody').append(datahtml);
					}
					makePaging(data.paging);
				},
				error: function(xhr, status, error){
					
				}
			}) // ajax closed

};// do_search closed

function makeData(data){
	var datahtml = "";
		datahtml += "<tr>";
		datahtml += "<td><input type='checkbox' id='checkOne' /></td>";
		datahtml += "<td>"+data.menu_cd+"</td>";
		datahtml += "<td>"+data.menu_name+"</td>";
		datahtml += "<td>"+data.menu_up+"</td>";
		datahtml += "<td>"+data.menu_sp+"</td>";
		datahtml += "<td>"+data.mn_reg_dt+"</td>";
		datahtml += "<td>"+data.mn_mod_dt+"</td>";
		datahtml += "</tr>";
			
		return datahtml;
}




