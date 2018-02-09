package kr.co.coffee.menu.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coffee.common.DTO;
import kr.co.coffee.common.MenuExcelDown;
import kr.co.coffee.common.domain.Search;
import kr.co.coffee.ingredient.domain.IngredientVO;
import kr.co.coffee.mapper.CommonMapper;
import kr.co.coffee.menu.domain.MenuVO;
import kr.co.coffee.menu.service.MenuSvc;

@Service("MenuSvc")
public class MenuSvcImpl implements MenuSvc {

	@Autowired
	private CommonMapper commonMapper;

	@Override
	public List<MenuVO> do_searchAll(Search search) throws Exception {

		return commonMapper.do_searchAll(search);
	}

	@Override
	public int menuTotalCount(Search search) throws Exception {

		return commonMapper.menuTotalCount(search);
	}

	@Override
	public List<MenuVO> menuDetail(String menuCodeOnClick) throws Exception {
		
		return commonMapper.menuDetail(menuCodeOnClick);
	}

	@Override
	public List<IngredientVO> getIngredientList(String searchIngredientName) throws Exception {

		return commonMapper.getIngredientList(searchIngredientName);
	}

	@Override
	public void deleteChecked(ArrayList<String> deleteArray) throws Exception {
		
	for(int i=0; i<deleteArray.size();i++) {
			commonMapper.deleteChecked(deleteArray.get(i));
		}

	}

	@Override
	public int do_checkMenuName(String menuName) throws Exception {
		
		return commonMapper.do_checkMenuName(menuName);
	}

	@Override
	public List<MenuVO> do_searchExcel(DTO dto) throws Exception {
		
		return commonMapper.do_searchExcel(dto);
	}

	@Override
	public String do_excelDown(List<MenuVO> list) throws Exception {
		
		String path = "C:\\file\\excel\\";
		MenuExcelDown menuExcelDown = new MenuExcelDown();
		String fileName = menuExcelDown.writeExcel(path, "MenuList.xls", list);

		return path+fileName;
	}

	@Override
	public String searchMenuCode(String menu_cd) throws Exception {
		return commonMapper.searchMenuCode(menu_cd);
	}

	@Override
	public void insertMenu(MenuVO menuVO) throws Exception {
		commonMapper.insertMenu(menuVO);
	}

	@Override
	public void insertRecipie(MenuVO menuVO) throws Exception {
		commonMapper.insertRecipie(menuVO);
	}

}
