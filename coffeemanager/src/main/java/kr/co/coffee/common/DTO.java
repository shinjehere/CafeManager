package kr.co.coffee.common;

import java.util.Hashtable;

/**
 * 최초작성: 2017-12-19
 * DTO: Data Transfer Object
 * @author SHINJE KIM
 *
 */
public class DTO {
	/**
	 * 조회인자
	 *  -조회구분: searchDiv,
	 *  -조회Data: searchWord
	 *  -조회Page 사이즈: pageSize
	 *  -조회Page NO: pageNo
	 */
	private Hashtable<String, String>  param =new Hashtable<String, String>();
	
	/**
	 * 글번호
	 */
	private int no;
	
	/**
	 * 총글수
	 */	
	private int totalNo;
	
	
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getTotalNo() {
		return totalNo;
	}

	public void setTotalNo(int totalNo) {
		this.totalNo = totalNo;
	}

	public Hashtable<String, String> getParam() {
		return param;
	}

	public void setParam(Hashtable<String, String> param) {
		this.param = param;
	}
	
}
