package com.whizlab.first.util.excel;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExcelServiceImpl implements ExcelService {

	@Autowired
	private ExcelDAO dao;
	
	@Override
	public void excelUpload(File destFile) throws Exception {
		ExcelReadOption excelOption = new ExcelReadOption();
		excelOption.setFilePath(destFile.getAbsolutePath());
		excelOption.setOutputColumns("A","B","C","D","E");
		
		excelOption.setStartRow(2);
		
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("YYYY-MM");
		
		List<Map<String, String>> excelContent = ExcelRead.readExcel(excelOption);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ExcelId", sf.format(date));
		paramMap.put("excelContent", excelContent);
		dao.InsertExcel(paramMap);
		
	}
}
