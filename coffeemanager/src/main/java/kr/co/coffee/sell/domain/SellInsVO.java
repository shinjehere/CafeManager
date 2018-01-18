package kr.co.coffee.sell.domain;

public class SellInsVO {
	/*{"click_code":click_code,"click_count":click_count}*/
	//�깮�꽦�븳 肄붾뱶瑜� �꽔湲� �쐞�븳 寃�
	private String code_SL;
	//硫붾돱肄붾뱶
	private String click_code;
	//�뙋留ㅺ갗�닔
	private int click_count;
	
	public String getCode_SL() {
		return code_SL;
	}
	public void setCode_SL(String code_SL) {
		this.code_SL = code_SL;
	}
	public String getClick_code() {
		return click_code;
	}
	public void setClick_code(String click_code) {
		this.click_code = click_code;
	}
	public int getClick_count() {
		return click_count;
	}
	public void setClick_count(int click_count) {
		this.click_count = click_count;
	}
}
