package kr.co.coffee.menu.service;

import java.util.ArrayList;
import java.util.List;

import kr.co.coffee.common.DTO;
import kr.co.coffee.common.domain.Search;
import kr.co.coffee.ingredient.domain.IngredientVO;
import kr.co.coffee.menu.domain.MenuVO;

public interface MenuSvc {

	/**
	 * 초기 화면을 위한 전체조회
	 * @param dto
	 * @return 전체 메뉴 리스트
	 * @throws Exception 
	 */
	public List<MenuVO> do_searchAll(Search search) throws Exception;
	
	public int menuTotalCount(Search search) throws Exception;
	
	public List<MenuVO> menuDetail(String menuCodeOnClick) throws Exception;
	
	public List<IngredientVO> getIngredientList(String searchIngredientName) throws Exception;
	
	// 메뉴 선택 삭제
	public void deleteChecked(ArrayList<String> deleteArray) throws Exception;
	
	// 메뉴명 중복확인
	public int do_checkMenuName(String menuName) throws Exception;
	
	// 엑셀 서치
	public List<MenuVO> do_searchExcel(DTO dto) throws Exception;
	
	// 엑셀 다운
	public String do_excelDown(List<MenuVO> list) throws Exception;
	
}
