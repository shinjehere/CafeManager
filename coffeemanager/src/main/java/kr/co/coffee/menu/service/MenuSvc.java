package kr.co.coffee.menu.service;

import java.util.List;

import kr.co.coffee.common.DTO;
import kr.co.coffee.menu.domain.MenuVO;

public interface MenuSvc {

	/**
	 * 초기 화면을 위한 전체조회
	 * @param dto
	 * @return 전체 메뉴 리스트
	 * @throws Exception 
	 */
	public List<MenuVO> do_searchAll() throws Exception;
}
