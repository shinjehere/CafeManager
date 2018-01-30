package kr.co.coffee.sell.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.co.coffee.common.MenuExcelDown;
import kr.co.coffee.common.SellExcelDown;
import kr.co.coffee.common.domain.Search;
import kr.co.coffee.mapper.CommonMapper;
import kr.co.coffee.menu.domain.MenuVO;
import kr.co.coffee.sell.domain.SellInsVO;
import kr.co.coffee.sell.domain.SellListVO;
import kr.co.coffee.sell.service.SellService;

/**
 * 
 * @author 源��쁺�꽠
 * @since 2017.12.26
 * SellServiceImpl implements SellService
 */
@Service("sellService")
public class SellServiceImpl implements SellService{
	
	@Autowired
	private CommonMapper CommonMapper;
	

	@Override
	public List<SellListVO> getSellList(Search search) throws Exception {
		return CommonMapper.getSellList(search);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return CommonMapper.getTotalCount(search);
	}

	@Override
	public List<SellListVO> detail_Sell(String togggle_value) throws Exception {
		
		return CommonMapper.detail_Sell(togggle_value);
	}

	@Override
	public List<MenuVO> menu_search(String menu_SH) throws Exception {
	
		return CommonMapper.menu_search(menu_SH);
	}

	@Override
	public String search_insert_code(String codeSL) throws Exception {
		return CommonMapper.search_insert_code(codeSL);
	}


	@Override
	public void sell_insert(SellInsVO sellInsVO) throws Exception {
		 CommonMapper.sell_insert(sellInsVO);
	}

	@Override
	public void SLDeleteChecked(List<String> deleteArray) throws Exception {
		for(int i=0;i<deleteArray.size();i++) {
			CommonMapper.SLDeleteChecked(deleteArray.get(i));
		}
	}

	@Override
	public String se_excelDown(List<SellListVO> list) throws Exception {
		String path = "C:\\file\\excel\\";
		SellExcelDown sellExcelDown=new SellExcelDown();
		String fileName=sellExcelDown.sell_writeExcel(path, "sellList.xls", list);
				/*SellExcelDown.sell_writeExcel(path, "sellList.xls", list);*/
		return path+fileName;
	}

	

	
	

}
