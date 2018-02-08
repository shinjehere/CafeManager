package kr.co.coffee.ingredient.service;

import java.util.List;

import kr.co.coffee.common.domain.Search;
import kr.co.coffee.ingredient.domain.IngredientVO;
import kr.co.coffee.sell.domain.SellListVO;

public interface IngredientService {
		/*리스트조회*/
		public List<IngredientVO> ingredient_list(Search search) throws Exception;
		//토탈카운트
		public int ingredient_totalcount(Search search) throws Exception; 
		//update
		public void ing_update(IngredientVO IngredientVO) throws Exception;
		//search code
		public String insert_search(String madeCode) throws Exception;
		//insert
		public void ing_insert(IngredientVO IngredientVO) throws Exception;
		//delete
		public void ing_delete(List<String> ing_cd) throws Exception;

		public String ing_excelDown(List<IngredientVO> list) throws Exception;
}