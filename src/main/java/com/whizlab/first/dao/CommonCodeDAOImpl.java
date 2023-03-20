package com.whizlab.first.dao;

import com.whizlab.first.vo.CommonCodeVO;
import com.whizlab.first.vo.MainCommonVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommonCodeDAOImpl implements CommonCodeDAO {
    @Autowired
    private SqlSession session;

    private static final String namespace = "com.whizlab.common";

    @Override
    public List<MainCommonVO> mainCommonList() throws Exception {
        return session.selectList(namespace + ".mainCodeList");
    }

    @Override
    public List<CommonCodeVO> commonCodeList(int commonCodeType) throws Exception {
        return session.selectList(namespace + ".commonCodeList", commonCodeType);
    }

    @Override
    public int commonMaxNum(int commonCodeType) throws Exception {
        return session.selectOne(namespace + ".commonMaxNum", commonCodeType);
    }

    @Override
    public void mainCodeInsert(MainCommonVO main) throws Exception {
        session.insert(namespace + ".mainCodeInsert", main);
    }

    @Override
    public void mainCodeDelete(MainCommonVO main) throws Exception {
        session.update(namespace + ".mainCodeDelete", main);
    }

    @Override
    public void commonCodeInsert(CommonCodeVO common) throws Exception {
        session.insert(namespace + ".commonCodeInsert", common);
    }

    @Override
    public void commonCodeDelete(CommonCodeVO common) throws Exception {
        session.update(namespace + ".commonCodeDelete", common);
    }
}
