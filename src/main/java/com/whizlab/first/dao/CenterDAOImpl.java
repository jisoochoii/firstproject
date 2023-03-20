package com.whizlab.first.dao;

import com.whizlab.first.vo.CenterVO;
import com.whizlab.first.vo.CommonCodeVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CenterDAOImpl implements CenterDAO{

    @Autowired
    private SqlSession session;

    private static final String namespace = "com.whizlab.center";
    private static final String commonNamespace = "com.whizlab.common";

    @Override
    public List<CenterVO> centerList() throws Exception {
        return session.selectList(namespace + ".centerList");
    }

    @Override
    public CenterVO centerView(int centerSeq) throws Exception {
        return session.selectOne(namespace + ".centerView", centerSeq);
    }

    @Override
    public List<CenterVO> searchCenter(Map<String, Object> map) throws Exception {
        return session.selectList(namespace + ".searchCenter", map);
    }

    @Override
    public int getCenterMaxNum(int bizCode) throws Exception {
        return session.selectOne(namespace +".getCenterMaxNum", bizCode);
    }

    @Override
    public void insertCenter(CenterVO center) throws Exception {
        session.insert(namespace + ".insertCenter", center);
    }

    @Override
    public void updateCenter(CenterVO center) throws Exception {
        session.update(namespace + ".updateCenter", center);
    }

    @Override
    public void deleteCenter(CenterVO center) throws Exception {
        session.update(namespace + ".deleteCenter", center);
    }

    @Override
    public List<CommonCodeVO> commonCodeEmail() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeEmail");
    }

    @Override
    public List<CommonCodeVO> commonCodeUsage() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeUsage");
    }
}
