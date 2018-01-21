package kr.co.coffee.stock.domain;


/*
 * 
 * SELECT ST.STOCK_CD, ST.ING_CD, ST.STOCK_CNT, ING.ING_NM, ING.ING_PRICE*STOCK_CNT
FROM STOCK AS ST
JOIN INGREDIENT AS ING
ON ING.ING_CD = ST.ING_CD;
 * */
public class StockList {
	private String stock_CD;
	private String ing_CD;
	private float stock_CNT;
	private String ing_NM;
	private String st_total_Price;
	public String getStock_CD() {
		return stock_CD;
	}
	public void setStock_CD(String stock_CD) {
		this.stock_CD = stock_CD;
	}
	public String getIng_CD() {
		return ing_CD;
	}
	public void setIng_CD(String ing_CD) {
		this.ing_CD = ing_CD;
	}
	public float getStock_CNT() {
		return stock_CNT;
	}
	public void setStock_CNT(float stock_CNT) {
		this.stock_CNT = stock_CNT;
	}

	public String getIng_NM() {
		return ing_NM;
	}
	public void setIng_NM(String ing_NM) {
		this.ing_NM = ing_NM;
	}
	public String getSt_total_Price() {
		return st_total_Price;
	}
	public void setSt_total_Price(String st_total_Price) {
		this.st_total_Price = st_total_Price;
	}
	
	
}
