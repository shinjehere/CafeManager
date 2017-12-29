package kr.co.coffee.menu.domain;

import kr.co.coffee.common.DTO;

public class MenuVO extends DTO {
	private String menu_cd;
	private String menu_name;
	private String menu_up;
	private String menu_sp;
	private String mn_reg_dt;
	private String mn_mod_dt;
	
	public MenuVO() {
		
	}
	
	public MenuVO(String menu_cd, String menu_name, String menu_up, String menu_sp, String mn_reg_dt,
			String mn_mod_dt) {
		super();
		this.menu_cd = menu_cd;
		this.menu_name = menu_name;
		this.menu_up = menu_up;
		this.menu_sp = menu_sp;
		this.mn_reg_dt = mn_reg_dt;
		this.mn_mod_dt = mn_mod_dt;
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

	@Override
	public String toString() {
		return "menuVO [menu_cd=" + menu_cd + ", menu_name=" + menu_name + ", menu_up=" + menu_up + ", menu_sp="
				+ menu_sp + ", mn_reg_dt=" + mn_reg_dt + ", mn_mod_dt=" + mn_mod_dt + "]";
	}
	
	
}
