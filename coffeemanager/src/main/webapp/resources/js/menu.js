

// 모달창
function new_menu() {
	$('#myModal').modal();
}

// 메뉴등록>원재료 검색
function searchIngredient() {
	var searchIngredientName = $('#searchIngdnt').val();
	console.log(searchIngredientName);
	$.ajax({
		url : "menu/searchIngdnt",
		data : {
			"searchIngredientName" : searchIngredientName
		},
		type : 'GET',
		dataType : "JSON",
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		success : function(data) {
			console.log(data);

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

// 테이블 row 클릭시 값 가져오기
function trClick() {
	$("#menu_table tr").click(function() {
		var tdArr = new Array();
		var tr = $(this);
		var td = tr.children();
		console.log("클릭한 Row의 모든 데이터 : " + tr.text());

		td.each(function(i) {
			tdArr.push(td.eq(i).text());
		});
		console.log("배열에 담긴 값 : " + tdArr);

		var ing_code = td.eq(0).text();
		var ing_name = td.eq(1).text();
		var ing_up = td.eq(2).text();

		$('#ing_click_code').text(ing_code);
		$('#ing_click_name').text(ing_name);
		$('#ing_unit_price').text(ing_up);

	});
}

// 메뉴 단가 계산
function calMenuUP() {
	var ing_code = $('#ing_click_code').text();
	if (ing_code == "") {
		alert("원재료를 검색 후 클릭해 주세요!");
	} else {
		var click_up = $('#ing_unit_price').text();
		console.log(click_up);
		var menuUnitAmount = $('#menuUnitAmount').val();
		if (menuUnitAmount == "") {
			alert("사용할 용량을 입력해주세요");
		} else if (menuUnitAmount == "0") {
			alert("0은 입력 불가합니다");
			$('#calMenuClick').text(null);
			$('#ing_unit_price').text(null);
		} else {
			var calMenuUP = click_up * menuUnitAmount;
			console.log(calMenuUP);
			$('#calMenuClick').text(calMenuUP);
			$('#menuUnitPrice').text(calMenuUP);
		}
	}
}

function reset() {
	$('#calMenuClick').text(null);
	$('#menuUnitPrice').text(null);
	$('#ing_click_code').text(null);
	$('#ing_click_name').text(null);
	$('#ing_unit_price').text(null);
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
			}
		},
		complete : function(data) {
		},
		error : function(xhr, status, error) {
		}
	}); // ajax closed

} // checkMenuName closed

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

				console.log("checkArray = " + checkArray);

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

// =========================================================
// For Paging
// =========================================================
/*
 * $(function() { menuBoard(); $("#searchBtn").click(function() {
 * $('#currentPage').val('1'); menuBoard(); }); });
 */

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

function clickPaging(currentPage) {
	$("#currentPage").val(currentPage);
	$("#pagination li").removeClass("active");
	menuBoard();
}

// =========================================================
// For Paging closed
// =========================================================

/*
 * // do_search 검색조회 function menuBoard() { var dataform =
 * $("#searchForm").serialize();
 *  // 검색결과(일단 날짜 빼고) $.ajax({ type : "GET", url : "menu/menu", dataType :
 * "JSON", contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
 * data : dataform, success : function(data) {
 * 
 * var datahtml = "";
 * 
 * if (data.list.length > 0) {
 * 
 * $("#menu_list_table tbody tr").remove(); console.log("data size= " +
 * data.list.length); for (var i = 0; i < data.list.length; i++) { datahtml +=
 * makeData(data.list[i]); } $('#menu_list_table tbody').append(datahtml); }
 * else { $('#menu_list_table tbody tr').remove(); datahtml += "<tr><td colspan=7>데이터가
 * 없습니다.</td></tr>" $('#menu_list_table tbody').append(datahtml); }
 *  // 엑셀 다운 $('#do_excelDown').click(function(){ do_excelDown(); });
 *  // 페이징 makePaging(data.paging); }, error : function(xhr, status, error) {
 *  } }) // ajax closed
 * 
 * };// do_search closed
 */

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
					console.log("data size= " + data.list.length);
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
					console.log("data size= " + data.list.length);
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
	datahtml += "<td>" + data.mn_mod_dt + "</td>";
	datahtml += "</tr>";
	datahtml += "<tr><td colspan='6' id='toggle_div" + data.menu_cd
			+ "' style='display: none;'><div></div></td></tr>";

	return datahtml;
}

// 메뉴 토글
function toggle(menuCodeOnClick) {

	$
			.ajax({
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
