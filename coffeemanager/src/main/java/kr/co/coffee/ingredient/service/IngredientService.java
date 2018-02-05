package kr.co.coffee.ingredient.service;

import java.util.List;

import kr.co.coffee.common.domain.Search;
import kr.co.coffee.ingredient.domain.IngredientVO;

public interface IngredientService {
		/*리스트조회*/
		public List<IngredientVO> ingredient_list(Search search) throws Exception;
		//토탈카운트
		public int ingredient_totalcount(Search search) throws Exception; 
}
