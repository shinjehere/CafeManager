package kr.co.coffee.ingredient.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coffee.common.SellExcelDown;
import kr.co.coffee.common.ingExcelDown;
import kr.co.coffee.common.domain.Search;
import kr.co.coffee.ingredient.domain.IngredientVO;
import kr.co.coffee.ingredient.service.IngredientService;
import kr.co.coffee.mapper.CommonMapper;
import kr.co.coffee.sell.domain.SellListVO;

@Service("ingredientService")
public class IngredientServiceImpl implements IngredientService{
	@Autowired
	private CommonMapper commonMapper;
	
	@Override
	public List<IngredientVO> ingredient_list(Search search) throws Exception {
		// TODO Auto-generated method stub
		return commonMapper.ingredient_list(search);
	}

	@Override
	public int ingredient_totalcount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return commonMapper.ingredient_totalcount(search);
	}

	@Override
	public void ing_update(IngredientVO IngredientVO) throws Exception {
			
		commonMapper.ing_update(IngredientVO);
	}

	@Override
	public String insert_search(String madeCode) throws Exception {
		
		return commonMapper.insert_search(madeCode);
	}

	@Override
	public void ing_insert(IngredientVO IngredientVO) throws Exception {
		
		commonMapper.ing_insert(IngredientVO);
	}

	@Override
	public void ing_delete(List<String> ing_cd) throws Exception {
		for(int i=0;i<ing_cd.size();i++) {
			commonMapper.ing_delete(ing_cd.get(i));
		}
		
	}

	@Override
	public String ing_excelDown(List<IngredientVO> list) throws Exception {
		String path = "C:\\file\\excel\\";
		ingExcelDown ingExcelDown=new ingExcelDown();
		String fileName=ingExcelDown.ing_writeExcel(path, "ingList.xls", list);
		return path+fileName;
	}

}
