function wrapWindowByMask(){ 
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

$(document).ready(function() {
	$("#start_date").datetimepicker({
		format : 'YYYY/MM/DD'
	});

	$("#end_date").datetimepicker({
		format : 'YYYY/MM/DD'
	});
});

/*
 * // datepicker $(function(){ $("#start_date").datetimepicker({ format :
 * 'YYYY/MM/DD' });
 * 
 * $("#end_date").datetimepicker({ format : 'YYYY/MM/DD' }); });
 */

/*
 * $(document).ready(function() { $('#start_date').datetimepicker({ format :
 * 'YYYY/MM/DD' });
 * 
 * $('#end_date').datetimepicker({ format : 'YYYY/MM/DD' });
 * 
 * var check = $("input[type='checkbox']"); check.click(function() {
 * $("p").toggle(); });
 * 
 * 
 * //**********************************************************************************
 * //***********버튼 Event
 * 모음*******************************************************
 * //**********************************************************************************
 * $("#allCheck").click(function() { $("#work_div").val("doSearch"); if
 * ($("#allCheck").prop("checked")) {// 전체선택 체크박스가 체크되어있으면
 * $("input[type=checkbox]").prop("checked", true); // 모든 checkbox 체크 } else { //
 * 전체선택 체크박스가 체크되어있지 않으면 $("input[type=checkbox]").prop("checked", false); // 모든
 * checkbox 체크해제 } }); // --전체선택Btn closed // 삭제Btn
 * $("input[name=doDelete]").click(function() {
 * $("#work_div").val("doDeleteDeal");
 * 
 * //colsole.log(" $(this) = "+ $(this).parent().val());
 * 
 * var d_deal_id = $(this).parent().children(0).val(); console.log(d_deal_id);
 * location.href =
 * '../GGMdeal/GGM_deal_control.jsp?work_div=doDeleteDeal&d_deal_id=' +
 * d_deal_id; });// --삭제Btn closed // 전체삭제Btn
 * $("#allDeleteBtn").click(function(){ // 전체삭제 버튼을 누르면 // 해당 페이지의
 * d_status(거래상태) 리스트를 받아옴 var dStList = []; $("input[name=
 * d_status_id]").each(function(i) { dStList.push($(this).val()); });
 *  // 기존페이지네이션 있을시 없애고 재생성 if ($('.pagination').data("twbs-pagination")) {
 * $('.pagination').twbsPagination('destroy'); } // 페이징
 * $('#pagination').twbsPagination({ totalPages : 35, visiblePages : 5,
 * onPageClick : function(event, page) { $('#page-content').text('Page ' +
 * page); } }); });
 */
