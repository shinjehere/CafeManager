//==============================================================
// 메뉴등록 모달창 start
//==============================================================

var count = 1; //function add_ingredient(): 원재료 추가를 위한 전역변수
var checkMenuFlag = 0; // btnCheckMenu 클릭 여부 확인을 위한 flag
var calMenuFlag = 0; // btnCalMenu 클릭 여부 확인을 위한 flag


// 메뉴등록 모달창의 값 리셋
function resetForm(){
	$("#menuName").text(null);
	$("#sellPrice").text(null);
	$("#searchIngdnt").val(null);
	$("#menu_table tbody").html(null);
	$("#ing_click_code").text(null);
	$("#ing_click_name").text(null);
	$("#ing_unit_price").text(null);
	$("#menuUnitAmount").text(null);
}
	
// 메뉴등록 모달창 실행
function new_menu() {
	$('#myModal').modal();
}

// 메뉴등록>원재료 검색
function searchIngredient() {
	var searchIngredientName = $('#searchIngdnt').val();

	$.ajax({
		url : "menu/searchIngdnt",
		data : {
			"searchIngredientName" : searchIngredientName
		},
		type : 'GET',
		dataType : "JSON",
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		success : function(data) {

			$('#menu_table tbody').html(function() {
				str = "";
				for (var i = 0; i < data.list.length; i++) {
					str += "<tr>";
					str += "<td>" + data.list[i].ing_cd + "</td>";
					str += "<td>" + data.list[i].ing_nm + "</td>";
					str += "<td>" + data.list[i].ing_price + "</td>";
					str += "<td>" + data.list[i].unit_amount + "</td>";
					str += "<td>" + data.list[i].ing_unit + "</td>";
					str += "</tr>";
				}
				return str;

			});
			trClick()
		},
		error : function(xhr, status, error) {
			// 에러
			alert("code:" + xhr.status);
		}
	});
}

// 원재료 추가하기
function add_ingredient(){
    var addedDiv  = document.createElement("div");
    addedDiv.id = "added_"+count; // 폼 Div에 ID 부여 (삭제를 위해)
    addedDiv.innerHTML = document.getElementById("added_0").innerHTML; // added_0 에 있는 내용을 읽어와서 처리
    
    var added_field = document.getElementById("added_field");
    added_field.appendChild(addedDiv);
    $("#added_"+count).find("#ing_click_code").empty();
    $("#added_"+count).find("#ing_click_name").empty();
    $("#added_"+count).find("#ing_unit_price").empty();
    count++;
    /*document.newMenuForm.count.value = count;
    added_field.reset();*/
}

// 원재료 삭제하기
function remove_ingredient(){
    var added_field = document.getElementById("added_field");
    if(count >1){ // 현재 폼이 두개 이상이면
               var addedDiv = document.getElementById("added_"+(--count));
               // 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴
               added_field.removeChild(addedDiv); // 폼 삭제 
    }else{ // 마지막 폼만 남아있다면
    	$('#ing_click_code').text(null);
    	$('#ing_click_name').text(null);
    	$('#ing_unit_price').text(null);
    	$('#menuUnitAmount').text(null);
    }
}

// 테이블 row 클릭시 값 가져오기
function trClick() {
	
	$("#menu_table tr").click(function() {
		var tdArr = new Array();
		var tr = $(this);
		var td = tr.children();

		td.each(function(i) {
			tdArr.push(td.eq(i).text());
		});

		var ing_code = td.eq(0).text();
		var ing_name = td.eq(1).text();
		var ing_up = td.eq(2).text();
		var ing_amount = td.eq(3).text();
		var int_cal = ing_up / ing_amount;

		for(var i=0 ; i<count; i++){
			if($("#added_"+i).find('[title="ing_click_code"]').text().length > 0){
				$("#added_"+(count)).find('[title="ing_click_code"]').html(ing_code);
				$("#added_"+(count)).find('[title="ing_click_name"]').html(ing_name);
				$("#added_"+(count)).find('[title="ing_unit_price"]').html(int_cal);
			}else{	
				$("#added_"+i).find('[title="ing_click_code"]').html(ing_code);
				$("#added_"+i).find('[title="ing_click_name"]').html(ing_name);
				$("#added_"+i).find('[title="ing_unit_price"]').html(int_cal);
			}
		}

	});
}

// 메뉴 단가 계산
function calMenuUP() {
	
	var totalPrice = 0;

	for(var i=0 ; i<count; i++){
		
		if( ($("#added_"+i).find('input[name="menuUnitAmount"]').val()) == "" ){
			alert("사용할 용량을 입력해주세요");
			$("#added_"+i).find('input[name="menuUnitAmount"]').focus();
			$('#calMenuClick').text(null);
			return;
		}else if( ($("#added_"+i).find('input[name="menuUnitAmount"]').val()) == "0" ){
			alert("0은 입력 할 수 없는 값입니다.");
			$("#added_"+i).find('input[name="menuUnitAmount"]').focus();
			$('#calMenuClick').text(null);
			return;
		}else{
			totalPrice += 
				((Number(($("#added_"+i).find('[title="ing_unit_price"]').html())))
				*(Number(($("#added_"+i).find('input[name="menuUnitAmount"]').val()))));	
			$('#calMenuClick').text(totalPrice.toFixed(2)+" 원");
			calMenuFlag = 1;
		}	
	}
}

// 메뉴 & 레시피 인서트
function saveMenu(){
	
	var menuName = $("#menuName").val();
	var sellPrice = $("#sellPrice").val();
	var calMenuClick = $("#calMenuClick").text().slice(0, -2);
	
	var ingCodeArray = new Array(); 
	for(var i = 0; i<count; i++){
		ingCodeArray.push($("#added_"+i).find('[title="ing_click_code"]').text());
	}

	var menuAmountArray = new Array(); 
	for(var i = 0; i<count; i++){
		menuAmountArray.push($("#added_"+i).find('input[name="menuUnitAmount"]').val());
	}

	if( menuName == "" ){
		alert("메뉴명을 입력해주세요.");
		$("#menuName").focus();
		return;
	}else if( checkMenuFlag == 0 ){
		alert("메뉴명 중복확인을 해주세요.");
		$("#btnCheckMenu").focus();
		return;
	}else if( calMenuFlag == 0 ){
		alert("메뉴 단가를 계산해주세요.");
		$("#btnCalMenu").focus();
		return;
	}else if( sellPrice == "" ){
		alert("메뉴 판매가를 입력해주세요.");
		$("#sellPrice").focus();
		return;
	}else{

		$.ajax({
			url: "menu/insertMenu",
			data: {
				"menuName": menuName,
				"sellPrice": sellPrice,
				"calMenuClick": calMenuClick,
				"ingCodeArray": JSON.stringify(ingCodeArray),
				"menuAmountArray": JSON.stringify(menuAmountArray)
			},
			type: 'POST',
			dataType: 'JSON',
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(data){
				location.href=data.url;
				menuBoard();
			}
		});
	}
}

// 메뉴명 중복확인
function checkMenuName() {

	var menuFlag = 0;

	var checkMenuName = $("#menuName").val().trim();

	if (checkMenuName == "") {
		alert("메뉴명을 입력해주세요.");
		return;
	}

	$.ajax({
		type : "POST",
		url : "menu/do_checkMenuName",
		dataType : "JSON",
		data : {
			"menuName" : checkMenuName
		},
		success : function(data) {
			var flag = ($.trim(data.flag));
			if (flag == "1") {
				alert("다른 메뉴명을 입력해 주십시오.");
			} else {
				alert("사용할 수 있는 메뉴명입니다.");
				menuFlag = 1;
				checkMenuFlag = 1;
			}
		},
		complete : function(data) {
		},
		error : function(xhr, status, error) {
		}
	}); // ajax closed

} // checkMenuName closed

//==============================================================
//메뉴등록 모달창 end
//==============================================================


//==============================================================
// 메뉴 리스트 조회 start
//==============================================================

// 삭제 버튼
$(function() {
	$("#deleteBtn").click(
			function() {
				var checkArray = "";
				var separator = "";

				$("input[name=checkOne]:checked").each(function() {
					checkArray += separator + $(this).attr("value");
					separator = ",";
				});

				if (checkArray.length == 0) {
					alert("삭제할 메뉴를 선택해주세요.");
				} else {

					if (confirm("정말 메뉴를 삭제하시겠습니까?") == true) {

						$.ajax({
							url : "menu/menuDel",
							type : "POST",
							data : {
								"deleteMenuArray" : checkArray
							},
							success : function(data) {
								location.href = "menu"
							},
							error : function(request, status, error) {
								alert("code:" + request.status + "\n"
										+ "message: " + request.responseText
										+ "\n" + "error: " + error);
							}
						}); // -- ajax closed
					} else {
						location.reload(true);
					}

				}
				return false;

			});// -- deleteBtn func closed
});// -- func closed

// 엑셀 다운
function do_excelDown() {
	var excelFrm = document.excel_frm;
	excelFrm.action = "menu/do_excelDown";
	excelFrm.submit();
}

// 검색 버튼 및 엔터시 실행된다.
function btnEnter() {
	$('#currentPage').val('1');
	menuBoard();
}

// 메뉴 리스트 불러오기
$(function() {
	menuBoard(); // 실행시 ajax list 불러오기 실행
	$("#searchBtn").click(function() {// 검색 찾기버튼
		btnEnter();
	});
	// 전체선택 체크박스
	$(function() {
		$("#allCheck").click(function() {
			$("#work_div").val("doSearch");
			if ($("#allCheck").prop("checked")) {// 전체선택 체크박스가 체크되어있으면
				$("input[id='checkOne']").prop("checked", true); // 모든
																	// checkbox
				// 체크
			} else { // 전체선택 체크박스가 체크되어있지 않으면
				$("input[id='checkOne']").prop("checked", false); // 모든
																	// checkbox
				// 체크해제
			}
		});
	});// --전체선택 체크박스 closed
});


// Paging
function makePaging(paging) {

	var currentPage = $("#currentPage").val();

	$("#startPage").val(paging.startPage);
	$("#endPage").val(paging.endPage);
	$("#pagination li").remove();

	var str = "";

	str += '<li><a href="#">&laquo;</a></li>';
	for (var i = paging.startPage; i < paging.endPage + 1; i++) {
		if (currentPage == i) {
			str += '<li class="active"><a href="#" onclick="clickPaging(' + i
					+ ')">' + i + '</a></li>';
		} else {
			str += '<li><a href="#" onclick="clickPaging(' + i + ')">' + i
					+ '</a></li>';
		}
	}

	str += '<li><a href="#">&raquo;</a></li>'

	$("#pagination").append(str);

}

// Pagination 클릭시 이동
function clickPaging(currentPage) {
	$("#currentPage").val(currentPage);
	$("#pagination li").removeClass("active");
	menuBoard();
}


// do_search 검색조회
function menuBoard() {

	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var stDate = new Date(startDate);
	stDate.setDate(stDate.getDate() + 1);
	var year = stDate.getFullYear().toString();
	var month = stDate.getMonth() + 1;
	var day = stDate.getDate();
	if (month < 10) {
		month = "0" + month;
	}
	if (day < 10) {
		day = "0" + day;
	}
	var Str_plus = year + "-" + month + "-" + day;

	if (startDate > endDate) {
		alert("시작일자가 종료일자보다 클 수 없습니다.");
		$("#endDate").val(Str_plus);
		$("#endDate").text(Str_plus);

		var dataform = $("#searchForm").serialize();
		$.ajax({
			type : "GET",
			url : "menu/menu",
			dataType : "JSON",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			data : dataform,
			success : function(data) {

				var datahtml = "";

				if (data.list.length > 0) {

					$("#menu_list_table tbody tr").remove();
					for (var i = 0; i < data.list.length; i++) {
						datahtml += makeData(data.list[i]);
					}
					$('#menu_list_table tbody').append(datahtml);
				} else {
					$('#menu_list_table tbody tr').remove();
					datahtml += "<tr><td colspan=7>데이터가 없습니다.</td></tr>"
					$('#menu_list_table tbody').append(datahtml);
				}

				// 엑셀 다운
				$('#do_excelDown').click(function() {
					do_excelDown();
				});

				// 페이징
				makePaging(data.paging);
			},
			error : function(xhr, status, error) {

			}
		}) // ajax closed
	} else {
		var dataform = $("#searchForm").serialize();

		$.ajax({
			type : "GET",
			url : "menu/menu",
			dataType : "JSON",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			data : dataform,
			success : function(data) {

				var datahtml = "";

				if (data.list.length > 0) {

					$("#menu_list_table tbody tr").remove();
					for (var i = 0; i < data.list.length; i++) {
						datahtml += makeData(data.list[i]);
					}
					$('#menu_list_table tbody').append(datahtml);
				} else {
					$('#menu_list_table tbody tr').remove();
					datahtml += "<tr><td colspan=7>데이터가 없습니다.</td></tr>"
					$('#menu_list_table tbody').append(datahtml);
				}

			  // 엑셀 다운
				$('#do_excelDown').click(function() {
					do_excelDown();
				});

				// 페이징
				makePaging(data.paging);
			},
			error : function(xhr, status, error) {

			}
		}); // ajax closed
	}
}// do_search closed

function makeData(data) {
	var datahtml = "";
	datahtml += "<tr>";
	datahtml += "<td><input type='checkbox' name='checkOne' value='"
			+ data.menu_cd + "'/></td>";
	datahtml += "<td><a class='menu_cd' href='#' onclick='javascript:toggle(\""
			+ data.menu_cd + "\")'>" + data.menu_cd + "</a></td>";
	datahtml += "<td>" + data.menu_name + "</td>";
	datahtml += "<td>" + data.menu_up + "</td>";
	datahtml += "<td>" + data.menu_sp + "</td>";
	datahtml += "<td>" + data.mn_reg_dt + "</td>";
	datahtml += "</tr>";
	datahtml += "<tr><td colspan='6' id='toggle_div" + data.menu_cd
			+ "' style='display: none;'><div></div></td></tr>";

	return datahtml;
}

// 메뉴 토글
function toggle(menuCodeOnClick) {

	$.ajax({
				url : "menu/" + menuCodeOnClick,
				data : JSON.stringify(menuCodeOnClick),
				type : "GET",
				dataType : "JSON",
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success : function(data) {
					$('#toggle_div' + menuCodeOnClick)
							.html(
									function() {

										var str = "";

										str += "<div class='container'><div class='col-xs-4 col-md-4'><table class='table'><caption>메뉴 레시피</caption>";
										str += "<thead><tr><th>원재료명</th><th>사용 용량</th><th>단위</th></tr></thead>";
										str += "<tbody>";

										if (data.list.length > 0) {

											for (var i = 0; i < data.list.length; i++) {
												str += "<tr>";
												str += "<th scope='row'>"
														+ (i + 1) + "</th>";
												str += "<td>"
														+ data.list[i].ing_nm
														+ "</td>";
												str += "<td>"
														+ data.list[i].menu_amount
														+ "</td>";
												str += "<td>"
														+ data.list[i].ing_unit
														+ "</td>";
												str += "</tr>";
											}
										} else {
											str += "<td>데이터가 없습니다.</td>";
										}
										str += "</tbody>";
										return str;
									});

					$('#toggle_div' + menuCodeOnClick).toggle('show');

					var list = JSON.stringify(data.list);

				}
			}); // --ajax closed
}
