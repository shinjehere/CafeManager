package kr.co.coffee.menu.service.impl;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coffee.mapper.CommonMapper;
import kr.co.coffee.menu.domain.MenuVO;
import kr.co.coffee.menu.service.MenuSvc;

@Service("MenuSvc")
public class MenuSvcImpl implements MenuSvc {

	@Autowired
	private CommonMapper commonMapper;

	@Override
	public List<MenuVO> do_searchAll() throws Exception {

		return commonMapper.do_searchAll();
	}

}
