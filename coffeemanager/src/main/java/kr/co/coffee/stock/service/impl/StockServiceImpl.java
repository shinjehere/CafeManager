package kr.co.coffee.stock.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coffee.common.DTO;
import kr.co.coffee.common.MenuExcelDown;
import kr.co.coffee.mapper.CommonMapper;
import kr.co.coffee.stock.domain.Criteria;
import kr.co.coffee.stock.domain.IngredientList;
import kr.co.coffee.stock.domain.NewProductList;
import kr.co.coffee.stock.domain.StockExcelDown;
import kr.co.coffee.stock.domain.StockList;
import kr.co.coffee.stock.domain.searchCriteria;
import kr.co.coffee.stock.service.StockService;

@Service("stockService")
public class StockServiceImpl implements StockService{
	//데이터 접근을 위한 Mapper 객체 선언
@Autowired
private CommonMapper CommonMapper;

	@Override
	public List<StockList> selectStockList() throws Exception {
		return CommonMapper.selectStockList();
	}

	@Override
	public List<StockList> listCriteria(Criteria cri) throws Exception {
		return CommonMapper.listCriteria(cri);
	}

	@Override
	public Integer totalCount() throws Exception {
		return CommonMapper.TotalCount();
	}

	@Override
	public List<IngredientList> searchIngredient(String searchIngredient) throws Exception {
		return CommonMapper.searchIngredient(searchIngredient);
	}

	@Override
	public String searchNewCode(String codeNP) throws Exception {
		return CommonMapper.searchNewCode(codeNP);
	}

	@Override
	public void ingredientInsert(NewProductList newProduct) throws Exception {
		CommonMapper.ingredientInsert(newProduct);
		
	}


	@Override
	public List<StockList> listSearchCriteria(searchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return CommonMapper.listSearchCriteria(cri);
	}

	@Override
	public Integer searchBoardTotalCount(searchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return CommonMapper.searchBoardTotalCount(cri);
	}

/*	@Override
	public List<StockList> stock_searchExcel(DTO dto) throws Exception {
		// TODO Auto-generated method stub
		return CommonMapper.stock_searchExcel(dto);
	}*/

	@Override
	public String stock_excelDown(List<StockList> list) throws Exception {
		String path ="C:\\file\\excel\\";
		
		String fileName = null;
		StockExcelDown stockExcelDown = new StockExcelDown();
		fileName = stockExcelDown.writeExcel(path, "StockList.xls", list);
		
		return path+fileName;
	}





}
