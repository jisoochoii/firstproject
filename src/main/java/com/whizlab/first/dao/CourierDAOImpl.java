package com.whizlab.first.dao;

import com.whizlab.first.vo.BizVO;
import com.whizlab.first.vo.CenterVO;
import com.whizlab.first.vo.CommonCodeVO;
import com.whizlab.first.vo.CourierVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CourierDAOImpl implements CourierDAO {
    @Autowired
    private SqlSession session;

    private static final String namespace = "com.whizlab.courier";
    private static final String commonNamespace = "com.whizlab.common";

    @Override
    public List<CourierVO> courierList(int bizCode) throws Exception {
        return session.selectList(namespace + ".courierList", bizCode);
    }

    @Override
    public CourierVO courierView(int courierSeq) throws Exception {
        return session.selectOne(namespace + ".courierView", courierSeq);
    }

    @Override
    public List<CourierVO> searchCourier(Map<String, Object> map) throws Exception {
        return session.selectList(namespace + ".searchCourier", map);
    }

    @Override
    public int getMaxNum() throws Exception {
        return session.selectOne(namespace + ".getMaxNum");
    }

    @Override
    public void insertCourier(CourierVO courier) throws Exception {
        session.insert(namespace + ".insertCourier", courier);
    }

    @Override
    public void updateCourier(CourierVO courier) throws Exception {
        session.update(namespace + ".updateCourier", courier);
    }

    @Override
    public void deleteCourier(CourierVO courier) throws Exception {
        session.update(namespace + ".deleteCourier", courier);
    }

    @Override
    public List<CommonCodeVO> commonCodeUsage() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeUsage");
    }

    @Override
    public List<BizVO> bizList() throws Exception {
        return session.selectList("com.whizlab.biz.bizList");
    }

    @Override
    public List<CenterVO> centerList(int bizCode) throws Exception {
        return session.selectList(namespace + ".centerList", bizCode);
    }
}
