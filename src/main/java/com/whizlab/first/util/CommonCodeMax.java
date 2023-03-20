package com.whizlab.first.util;

import com.whizlab.first.dao.CommonCodeDAO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class CommonCodeMax {
    @Autowired
    private SqlSession session;

    public int insertCommonCodeMaxNumber(int mainCode, String type){
        int mc = mainCode * 1000;
        Map<String, Object> map = new HashMap<>();
        map.put("cmnMainCode", mainCode);
        map.put("cmnCommonTypeMaxNum", mc);
        map.put("cmnType", type);

        session.insert("com.whizlab.common.insertCommonCodeMaxNumber", map);

        int  maxNum = session.selectOne("com.whizlab.common.selectCommonCodeMaxNumber", mainCode);

        return maxNum;
    }

    public int updateCommonCodeMaxNumber(int cmnCommonTypeMaxNum, int mainCode, String type){
        Map<String, Object> map = new HashMap<>();
        map.put("cmnMainCode", mainCode);
        map.put("cmnCommonTypeMaxNum", cmnCommonTypeMaxNum);
        map.put("cmnType", type);

        if(cmnCommonTypeMaxNum < cmnCommonTypeMaxNum + 1){
            session.update("com.whizlab.common.updateCommonCodeMaxNumber", map);
        }

        int maxNum = session.selectOne("com.whizlab.common.selectCommonCodeMaxNumber", mainCode);

        return maxNum;
    }
}
