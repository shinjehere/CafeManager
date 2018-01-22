package kr.co.coffee.mapper;

import java.util.ArrayList;
import java.util.List;

import kr.co.coffee.common.domain.Search;
import kr.co.coffee.ingredient.domain.IngredientVO;
import kr.co.coffee.menu.domain.MenuVO;
import kr.co.coffee.sell.domain.SellInsVO;
import kr.co.coffee.sell.domain.SellListVO;
import kr.co.coffee.stock.domain.StockList;

/**
 * 수정일: 2018-01-08 CommonMapper: 공동 매퍼
 * 
 * @author SHINJE KIM
 *
 *         코드 정리를 위해 각자의 부분에 해당하는 주석 아래에 매퍼를 생성합니다.
 */
public interface CommonMapper {

	
	// sell mapper *********************************************************************************	
	//판매 리스트 전체 조회
	public List<SellListVO> getSellList(Search search) throws Exception;
	// 페이징을 위한 전체 리스트 카운트
	public int getTotalCount(Search search) throws Exception;
	//코드 클릭시 토글로 상세 정보 보여주기
	public List<SellListVO> detail_Sell(String togggle_value) throws Exception;
	//메뉴 찾기
	public List<MenuVO> menu_search(String menu_SH) throws Exception;
	//인서트 전 코드 검색 후 확인
	public String search_insert_code(String codeSL) throws Exception;
	//판매 인서트 추가
	public void sell_insert(SellInsVO sellInsVO) throws Exception;
	//*************************************************************************************************

	// menu mapper *********************************************************************************
	// 메뉴 리스트 전체 조회
	public List<MenuVO> do_searchAll(Search search) throws Exception; 

	// 페이징을 위한 메뉴 리스트 count
	public int menuTotalCount(Search search) throws Exception; 
	// public List<MenuVO> do_searchAll() throws Exception;

	// 토글 이벤트(메뉴코드 클릭시 메뉴 디테일 불러옴)
	public List<MenuVO> menuDetail(String menuCodeOnClick) throws Exception; 
	
	// 메뉴등록시 원재료 리스트 불러오기
	public List<IngredientVO> getIngredientList(String searchIngredientName) throws Exception;
	
	// 메뉴 선택 삭제
	public void deleteChecked(String deleteArray) throws Exception;
	
	// 메뉴명 중복확인
	public int do_checkMenuName(String menuName) throws Exception;
	//*******************************************************************************************
	
	

	// stock mapper *********************************************************************************
	public List<StockList> selectStockList() throws Exception;
	//*************************************************************************************************
	
	
	// ingredient mapper***************************************************************************
	
	//**********************************************************************************************
	
	
	// test mapper

}
