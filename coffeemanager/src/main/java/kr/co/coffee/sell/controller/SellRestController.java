/*package kr.co.coffee.sell.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.coffee.common.pagingUtil;
import kr.co.coffee.common.domain.Paging;
import kr.co.coffee.common.domain.Search;
import kr.co.coffee.sell.domain.SellList;
import kr.co.coffee.sell.service.SellService;

@RestController
@RequestMapping(path="/sell")
public class SellRestController {

	@Autowired
	private SellService sellService;
	
	@RequestMapping(method=RequestMethod.GET)
	public Map<String, Object> sellList(@RequestParam(defaultValue="1") int searchDiv,
			@RequestParam(defaultValue="") String searchValue,
			@RequestParam(required=false, defaultValue="1") int currentPage) throws Exception {
		Search search=new Search();
		search.setCurrentPage(currentPage);
		search.setSearchDiv(searchDiv);
		search.setSearchValue(searchValue);
		int totalcount=sellService.getTotalCount(search);
		Paging paging=pagingUtil.getPaging(search, totalcount);
		search.setStartCount(paging.getStartCount());
		List<SellList> list=sellService.getSellList(search);
		Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("paging", paging);
			
			return map;
		
	}
}
*/