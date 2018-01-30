$(function(){
	closeModal();
	getTimeStamp();
	searchIngredient();
	totalPrice();//
	stock_excelDown();
	searchStock();
	searchSort();
	
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

//재고 리스트 검색function searchStock(){
	$('#searchBtn').on("click",function(event){
		var searchType = $("select[name=searchType]").val();
		var searchKeyword = $("input[name=searchKeyword]").val();
		self.location="../coffee/stock${pageMaker.makeQuery(1)}&searchType="+searchType+"&searchKeyword="+searchKeyword;
		
	});

//재고 리스트 정렬
function searchSort(){
	/*$("#search_sort").change(function(){*/
	/*	var searchType = $("select[name=searchType]").val();
		var searchKeyword = $("input[name=searchKeyword]").val();*/
		var searchSort = $("#search_sort option:selected").val();
		alert(stockSort)
		self.location = "../coffee/stock${pageMaker.makeQuery(1)}&searchSort="+searchSort;
		
	/*});*/
}
//원재료 검색
function searchIngredient(){
	$(".search_btn").click(function(){
		var searchIngredient=$(".search_ingredient").val(); 
		if(searchIngredient.length<1){
			alert("검색어를 입력해 주세요.")
		}else{
			
			$.ajax({
				url : "stock/stockPopup",
				data : {"searchIngredient" : searchIngredient},
				type : "POST",
				/*contentType : 'application/x-www-form-urlencoded; charset=UTF-8',*/
				success : function(data){
					$('#searchTable tbody').html(function(){
						str="";
						if(data.list.length!=0){
							for(var i=0; i<data.list.length;i++){
								str+="<tr>";
								str+="<td>"+data.list[i].ing_CD+"</td>";
								str+="<td>"+data.list[i].ing_NM+"</td>";
								str+="<td>"+data.list[i].ing_PRICE+"</td>";
								str+="<td>"+data.list[i].unit_AMOUNT+"</td>";
								str+="<td>"+data.list[i].ing_UNIT+"</td>";
								str+="</tr>";
							}
						}else{
								alert("검색 결과가 없습니다. ")
							
						}
						return str;
					});
					 onClickIngredient();
				},
				error: function(xhr, status, error){
					alert("code:"+xhr.status);
				}
			
			});
			
		}
				
	})//click event
	
};

//원재료 클릭 이벤트
function onClickIngredient(){

	$('#searchTable tr').click(function(){
		var chkArr = new Array();
		var tr = $(this);
		var td = tr.children();
		
		td.each(function(i){
			chkArr.push(td.eq(i).text());
		});
		
		var ingredient_cd=td.eq(0).text();
		var ingredient_name=td.eq(1).text();
		var ingredient_price=td.eq(2).text();
		var ingredient_amount=td.eq(3).text();
		var ingredient_unit=td.eq(4).text();
		$('#ingredient_cd').text(ingredient_cd).hide();
		$('#ingredient_name').text(ingredient_name);
		$('#ingredient_price').text(ingredient_price);
		$('#ingredient_amount').text(ingredient_amount);
		$('#ingredient_unit').text(ingredient_unit);
	})

};

//저장버튼, x버튼 클릭시 reset
function reset(){
	$('#ingredient_cd').text(null);
	$('#ingredient_name').text(null);
	$('#ingredient_price').text(null);
	$('#ingredient_amount').text(null);
	$('#ingredient_unit').text(null);
	$('#searchTable tbody').html(null);
	$('#ingredient_count').val(null);
	$('#msg').val(null);
	$('.search_ingredient').val(null);
};

//단가계산
function totalPrice(){
	var n = document.getElementById('ingredient_count').value;
	var price = $('#ingredient_price').text();
	var total =(n*price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	

	$('#msg').val(total+"원");
}

//원재료 insert
function saveIngredient(){
	var select_cd=$('#ingredient_cd').text();
	var select_name=$('#ingredient_name').text();
	var select_price=$('#ingredient_price').text();
	var select_amount=$('#ingredient_amount').text();
	var select_unit=$('#ingredient_unit').text();
	var select_count=$('#ingredient_count').val();
	if(select_name==""||select_price==""||select_amount==""||select_unit==""||select_count=="0"){
		alert("원재료를 선택하세요.")
	}else{
		$.ajax({
			url:'stock/income',
			data:{"select_cd":select_cd, "select_count":select_count},
			type:'POST',
			dataType:'JSON',
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(data){
				location.href=data.url;
				alert("입고 되었습니다.")
			}
			
		})//ajax
	}//if
	
};


//엑셀 다운
function stock_excelDown(){
	$('#stock_excelDown').click(function(){
		alert("다운로드")
		var excelFrm = document.stock_excel_frm;
		excelFrm.action = "stock/stock_excelDown";
		excelFrm.submit();
	})
}



