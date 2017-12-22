package kr.co.coffee.common;

import java.util.List;


/**
 * 최초작성: 2017-12-19
 * WorkDiv 최초 작성
 * 거래표준 메소드 정의
 * 
 * do_save   : 저장
 * do_search : 조회
 * do_delete : 삭제
 * do_update : 수정
 * do_excelDown
 * do_excelUp
 * 
 * @author SHINJE KIM
 */
public interface WorkDiv {

	public int do_save(DTO dto);
	public List<?> do_search(DTO dto);
	public int do_delete(DTO dto);
	public int do_update(DTO dto);
	public int do_excelDown(List<?> list);
	public int do_excelUp(List<?> list);
}
