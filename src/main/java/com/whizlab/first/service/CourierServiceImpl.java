package com.whizlab.first.service;

import com.whizlab.first.dao.CourierDAO;
import com.whizlab.first.vo.BizVO;
import com.whizlab.first.vo.CenterVO;
import com.whizlab.first.vo.CommonCodeVO;
import com.whizlab.first.vo.CourierVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CourierServiceImpl implements CourierService {
    @Autowired
    private CourierDAO dao;

    @Override
    public List<CourierVO> courierList(int bizCode) throws Exception {
        return dao.courierList(bizCode);
    }

    @Override
    public CourierVO courierView(int courierSeq) throws Exception {
        return dao.courierView(courierSeq);
    }

    @Override
    public List<CourierVO> searchCourier(Map<String, Object> map) throws Exception {
        return dao.searchCourier(map);
    }

    @Override
    public int getMaxNum() throws Exception {
        return dao.getMaxNum();
    }

    @Override
    public void insertCourier(CourierVO courier) throws Exception {
        dao.insertCourier(courier);
    }

    @Override
    public void updateCourier(CourierVO courier) throws Exception {
        dao.updateCourier(courier);
    }

    @Override
    public void deleteCourier(CourierVO courier) throws Exception {
        dao.deleteCourier(courier);
    }

    @Override
    public List<CommonCodeVO> commonCodeUsage() throws Exception {
        return dao.commonCodeUsage();
    }

    @Override
    public List<BizVO> bizList() throws Exception {
        return dao.bizList();
    }

    @Override
    public List<CenterVO> centerList(int bizCode) throws Exception {
        return dao.centerList(bizCode);
    }
}
