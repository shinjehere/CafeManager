$(function(){
	closeModal();
	getTimeStamp();
});

/*디폴트값으로 현재 날짜 설정*/
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

/*팝업창 닫으면 값 초기화*/
function closeModal(){
	$('.close').click(function(){
		getTimeStamp();
		
	});
		
}

$(document).ready(function(){
	$('#searchTable').dataTable({
		pageLength: 3,
		bPaginate: false,
		bLengthChange: true,
		lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
		bAutoWidth: false,
		processing: true,
		serverSide: false,
		seaching: true,
		ajax: {
			"url" : "",
			"type" : "POST",
			"data" : function (d){
				d.stockStatCd ="NR";
			}
		},
		columns : [
			{data: "ingCd"},
			{data: "ingNm"},
			{data: "ingPrice"},
			{data: "unitAmount"},
			{data: "ingUnit"}
			
		]
	});
});
