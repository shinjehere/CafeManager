$(function(){
	$("#allCheck").click(function() { 
		$("#work_div").val("doSearch");
		if ($("#allCheck").prop("checked")) {// 전체선택 체크박스가 체크되어있으면 
			$("input[type=checkbox]").prop("checked", true); // 모든 checkbox 체크 
		} else { // 전체선택 체크박스가 체크되어있지 않으면 
			$("input[type=checkbox]").prop("checked", false); // 모든 checkbox 체크해제
		}
	}); // --전체선택Btn closed
});

$(document).ready(function() {
	$('#start_date').datetimepicker({
		format : 'YYYY/MM/DD'
	});

	$('#end_date').datetimepicker({
		format : 'YYYY/MM/DD'
	});

	
	//**********************************************************************************
	//***********버튼 Event 모음*******************************************************
	//**********************************************************************************
	/*$("#allCheck").click(function() { 
		$("#work_div").val("doSearch");
		if ($("#allCheck").prop("checked")) {// 전체선택 체크박스가 체크되어있으면 
			$("input[type=checkbox]").prop("checked", true); // 모든 checkbox 체크 
		} else { // 전체선택 체크박스가 체크되어있지 않으면 
			$("input[type=checkbox]").prop("checked", false); // 모든 checkbox 체크해제
		}
	}); // --전체선택Btn closed
*/
	/*// 삭제Btn
	$("input[name=doDelete]").click(function() {
						$("#work_div").val("doDeleteDeal");
						
						//colsole.log(" $(this) = "+ $(this).parent().val());
						
						var d_deal_id = $(this).parent().children(0).val();
						console.log(d_deal_id);
						location.href = '../GGMdeal/GGM_deal_control.jsp?work_div=doDeleteDeal&d_deal_id='
								+ d_deal_id;
	});// --삭제Btn closed
	
	// 전체삭제Btn
	$("#allDeleteBtn").click(function(){ // 전체삭제 버튼을 누르면
		// 해당 페이지의 d_status(거래상태) 리스트를 받아옴 
		var dStList = [];			
		    $("input[name= d_status_id]").each(function(i) {	
		    	dStList.push($(this).val());
		    });	*/

	
	/*// 기존페이지네이션 있을시 없애고 재생성
	if ($('.pagination').data("twbs-pagination")) {
		$('.pagination').twbsPagination('destroy');
	}

	// 페이징
	$('#pagination').twbsPagination({
		totalPages : 35,
		visiblePages : 5,
		onPageClick : function(event, page) {
			$('#page-content').text('Page ' + page);
		}
	});*/
});
