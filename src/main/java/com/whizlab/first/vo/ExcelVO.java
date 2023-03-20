package com.whizlab.first.vo;

import org.springframework.stereotype.Component;

@Component
public class ExcelVO {
	private String ExcelId;
	private String Monday;
	private String Tuesday;
	private String Wednesday;
	private String Thursday;
	private String Friday;
	
	public String getExcelId() {
		return ExcelId;
	}
	public void setExcelId(String excelId) {
		ExcelId = excelId;
	}
	public String getMonday() {
		return Monday;
	}
	public void setMonday(String monday) {
		Monday = monday;
	}
	public String getTuesday() {
		return Tuesday;
	}
	public void setTuesday(String tuesday) {
		Tuesday = tuesday;
	}
	public String getWednesday() {
		return Wednesday;
	}
	public void setWednesday(String wednesday) {
		Wednesday = wednesday;
	}
	public String getThursday() {
		return Thursday;
	}
	public void setThursday(String thursday) {
		Thursday = thursday;
	}
	public String getFriday() {
		return Friday;
	}
	public void setFriday(String friday) {
		Friday = friday;
	}

}
