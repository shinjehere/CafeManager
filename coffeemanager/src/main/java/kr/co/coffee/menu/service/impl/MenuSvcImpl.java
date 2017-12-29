package kr.co.coffee.menu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.coffee.menu.dao.MenuDAO;
import kr.co.coffee.menu.domain.MenuVO;
import kr.co.coffee.menu.service.MenuSvc;

@Service("MenuSvc")
public class MenuSvcImpl implements MenuSvc {

	@Resource(name = "MenuDAO")
	private MenuDAO menuDao;

	@Override
	public List<MenuVO> do_searchAll() throws Exception {

		return menuDao.do_searchAll();
	}

}
