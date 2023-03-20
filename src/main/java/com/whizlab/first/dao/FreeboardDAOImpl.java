package com.whizlab.first.dao;

import com.whizlab.first.vo.FreeboardVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FreeboardDAOImpl implements FreeboardDAO{

    @Autowired
    private SqlSession session;

    private static final String namespace = "com.whizlab.fb";

    @Override
    public List<FreeboardVO> fbList() throws Exception {
        return session.selectList(namespace+".fbList");
    }

    @Override
    public FreeboardVO fbViewList(int fbSeq) throws Exception {
        return session.selectOne(namespace+".fbViewList", fbSeq);
    }

    @Override
    public void fbInsert(FreeboardVO fb) throws Exception {
        session.insert(namespace+".fbInsert", fb);
    }

    @Override
    public void fbUpdate(FreeboardVO fb) throws Exception {
        session.update(namespace+".fbUpdate", fb);
    }

    @Override
    public void fbDel(int fbSeq) throws Exception {
        session.update(namespace+".fbDel", fbSeq);
    }
}
