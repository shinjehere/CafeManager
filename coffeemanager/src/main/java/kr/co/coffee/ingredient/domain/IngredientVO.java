package kr.co.coffee.ingredient.domain;

import kr.co.coffee.common.DTO;

public class IngredientVO extends DTO {
	private String ing_cd;
	private String ing_nm;
	private String ing_price;
	private String unit_amount;
	private String ing_unit;
	private String in_reg_dt;
	private String in_mod_dt;

	
	public IngredientVO() {

	}

	public IngredientVO(String ing_cd, String ing_nm, String ing_price, String unit_amount, String ing_unit,
			String in_reg_dt, String in_mod_dt) {
		super();
		this.ing_cd = ing_cd;
		this.ing_nm = ing_nm;
		this.ing_price = ing_price;
		this.unit_amount = unit_amount;
		this.ing_unit = ing_unit;
		this.in_reg_dt = in_reg_dt;
		this.in_mod_dt = in_mod_dt;
	}

	public String getIng_cd() {
		return ing_cd;
	}

	public void setIng_cd(String ing_cd) {
		this.ing_cd = ing_cd;
	}

	public String getIng_nm() {
		return ing_nm;
	}

	public void setIng_nm(String ing_nm) {
		this.ing_nm = ing_nm;
	}

	public String getIng_price() {
		return ing_price;
	}

	public void setIng_price(String ing_price) {
		this.ing_price = ing_price;
	}

	public String getUnit_amount() {
		return unit_amount;
	}

	public void setUnit_amount(String unit_amount) {
		this.unit_amount = unit_amount;
	}

	public String getIng_unit() {
		return ing_unit;
	}

	public void setIng_unit(String ing_unit) {
		this.ing_unit = ing_unit;
	}

	public String getIn_reg_dt() {
		return in_reg_dt;
	}

	public void setIn_reg_dt(String in_reg_dt) {
		this.in_reg_dt = in_reg_dt;
	}

	public String getIn_mod_dt() {
		return in_mod_dt;
	}

	public void setIn_mod_dt(String in_mod_dt) {
		this.in_mod_dt = in_mod_dt;
	}

	@Override
	public String toString() {
		return "IngredientVO [ing_cd=" + ing_cd + ", ing_nm=" + ing_nm + ", ing_price=" + ing_price + ", unit_amount="
				+ unit_amount + ", ing_unit=" + ing_unit + ", in_reg_dt=" + in_reg_dt + ", in_mod_dt=" + in_mod_dt
				+ "]";
	}

}
