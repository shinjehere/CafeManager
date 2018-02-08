package kr.co.coffee.menu.domain;

import kr.co.coffee.common.DTO;

public class MenuVO extends DTO {
	private String menu_cd;
	private String menu_name;
	private String menu_up;
	private String menu_sp;
	private String mn_reg_dt;
	private String mn_mod_dt;
	private String ing_nm;
	private String menu_amount;
	private String ing_unit;
	private String searchDiv;
	private String startDate;
	private String endDate;
	private String searchValue;
	
	public MenuVO() {
		
	}
	
	public MenuVO(String menu_cd, String menu_name, String menu_up, String menu_sp, String mn_reg_dt, String mn_mod_dt,
			String ing_nm, String menu_amount, String ing_unit, String searchDiv, String startDate, String endDate,
			String searchValue) {
		super();
		this.menu_cd = menu_cd;
		this.menu_name = menu_name;
		this.menu_up = menu_up;
		this.menu_sp = menu_sp;
		this.mn_reg_dt = mn_reg_dt;
		this.mn_mod_dt = mn_mod_dt;
		this.ing_nm = ing_nm;
		this.menu_amount = menu_amount;
		this.ing_unit = ing_unit;
		this.searchDiv = searchDiv;
		this.startDate = startDate;
		this.endDate = endDate;
		this.searchValue = searchValue;
	}

	public String getMenu_cd() {
		return menu_cd;
	}

	public void setMenu_cd(String menu_cd) {
		this.menu_cd = menu_cd;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getMenu_up() {
		return menu_up;
	}

	public void setMenu_up(String menu_up) {
		this.menu_up = menu_up;
	}

	public String getMenu_sp() {
		return menu_sp;
	}

	public void setMenu_sp(String menu_sp) {
		this.menu_sp = menu_sp;
	}

	public String getMn_reg_dt() {
		return mn_reg_dt;
	}

	public void setMn_reg_dt(String mn_reg_dt) {
		this.mn_reg_dt = mn_reg_dt;
	}

	public String getMn_mod_dt() {
		return mn_mod_dt;
	}

	public void setMn_mod_dt(String mn_mod_dt) {
		this.mn_mod_dt = mn_mod_dt;
	}

	public String getIng_nm() {
		return ing_nm;
	}

	public void setIng_nm(String ing_nm) {
		this.ing_nm = ing_nm;
	}

	public String getMenu_amount() {
		return menu_amount;
	}

	public void setMenu_amount(String menu_amount) {
		this.menu_amount = menu_amount;
	}

	public String getIng_unit() {
		return ing_unit;
	}

	public void setIng_unit(String ing_unit) {
		this.ing_unit = ing_unit;
	}

	public String getSearchDiv() {
		return searchDiv;
	}

	public void setSearchDiv(String searchDiv) {
		this.searchDiv = searchDiv;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	@Override
	public String toString() {
		return "MenuVO [menu_cd=" + menu_cd + ", menu_name=" + menu_name + ", menu_up=" + menu_up + ", menu_sp="
				+ menu_sp + ", mn_reg_dt=" + mn_reg_dt + ", mn_mod_dt=" + mn_mod_dt + ", ing_nm=" + ing_nm
				+ ", menu_amount=" + menu_amount + ", ing_unit=" + ing_unit + ", searchDiv=" + searchDiv
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", searchValue=" + searchValue + "]";
	}
	

}
