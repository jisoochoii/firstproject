package com.whizlab.first.util.excel;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExcelDAOImpl implements ExcelDAO{

	@Autowired
	private SqlSession sql;
	
	private static final String namespace = "com.ableAi.excel";
	
	@Override
	public void InsertExcel(Map<String, Object> paramMap) throws Exception {
		sql.insert(namespace+".InsertExcel",paramMap);
	}
	
}
