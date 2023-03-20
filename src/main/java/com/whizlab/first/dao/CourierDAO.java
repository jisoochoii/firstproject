package com.whizlab.first.dao;

import com.whizlab.first.vo.BizVO;
import com.whizlab.first.vo.CenterVO;
import com.whizlab.first.vo.CommonCodeVO;
import com.whizlab.first.vo.CourierVO;

import java.util.List;
import java.util.Map;

public interface CourierDAO {
    public List<CourierVO> courierList(int bizCode) throws Exception;
    public CourierVO courierView(int courierSeq) throws Exception;
    public List<CourierVO> searchCourier(Map<String, Object> map) throws Exception;
    public int getMaxNum() throws Exception;

    public void insertCourier(CourierVO courier) throws Exception;
    public void updateCourier(CourierVO courier) throws Exception;
    public void deleteCourier(CourierVO courier) throws Exception;

    public List<CommonCodeVO> commonCodeUsage() throws Exception;

    public List<BizVO> bizList() throws Exception;
    public List<CenterVO> centerList(int bizCode) throws Exception;
}
