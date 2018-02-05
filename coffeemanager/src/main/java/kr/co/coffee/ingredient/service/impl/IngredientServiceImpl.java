package kr.co.coffee.ingredient.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coffee.common.domain.Search;
import kr.co.coffee.ingredient.domain.IngredientVO;
import kr.co.coffee.ingredient.service.IngredientService;
import kr.co.coffee.mapper.CommonMapper;

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

}
