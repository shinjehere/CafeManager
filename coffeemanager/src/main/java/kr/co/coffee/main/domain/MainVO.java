package kr.co.coffee.main.domain;

import java.util.Date;

public class MainVO {
	
		private String sell_CD;
		private String sell_Date;
		private String menu_CD;
		private String menu_Name;
		private int sell_CNT;
		private int total_SP;
		private String ing_CD;
		private String ing_NM;
		private int menu_Amount;
		private String hour;
		public String getSell_CD() {
			return sell_CD;
		}
		public void setSell_CD(String sell_CD) {
			this.sell_CD = sell_CD;
		}
		public String getSell_Date() {
			return sell_Date;
		}
		public void setSell_Date(String sell_Date) {
			this.sell_Date = sell_Date;
		}
		public String getMenu_CD() {
			return menu_CD;
		}
		public void setMenu_CD(String menu_CD) {
			this.menu_CD = menu_CD;
		}
		public String getMenu_Name() {
			return menu_Name;
		}
		public void setMenu_Name(String menu_Name) {
			this.menu_Name = menu_Name;
		}
		public int getSell_CNT() {
			return sell_CNT;
		}
		public void setSell_CNT(int sell_CNT) {
			this.sell_CNT = sell_CNT;
		}
		public int getTotal_SP() {
			return total_SP;
		}
		public void setTotal_SP(int total_SP) {
			this.total_SP = total_SP;
		}
		public String getIng_CD() {
			return ing_CD;
		}
		public void setIng_CD(String ing_CD) {
			this.ing_CD = ing_CD;
		}
		public String getIng_NM() {
			return ing_NM;
		}
		public void setIng_NM(String ing_NM) {
			this.ing_NM = ing_NM;
		}
		public int getMenu_Amount() {
			return menu_Amount;
		}
		public void setMenu_Amount(int menu_Amount) {
			this.menu_Amount = menu_Amount;
		}
		
		
		public String getHour() {
			return hour;
		}
		public void setHour(String hour) {
			this.hour = hour;
		}
		@Override
		public String toString() {
			return "SellList [sell_CD="+sell_CD+", sell_Date="+sell_Date+",menu_CD="+menu_CD+",menu_Name="+menu_Name+",sell_CNT="
					+sell_CNT+",total_SP="+total_SP+",ing_CD="+ing_CD+",ing_NM="+ing_NM+"menu_Amount"+menu_Amount+"]";
		}

		
		
	

}
