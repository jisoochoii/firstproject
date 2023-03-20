package com.whizlab.first.service;

import com.whizlab.first.dao.CenterDAO;
import com.whizlab.first.vo.CenterVO;
import com.whizlab.first.vo.CommonCodeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CenterServiceImpl implements CenterService{
    @Autowired
    private CenterDAO dao;

    @Override
    public List<CenterVO> centerList() throws Exception {
        return dao.centerList();
    }

    @Override
    public CenterVO centerView(int centerSeq) throws Exception {
        return dao.centerView(centerSeq);
    }

    @Override
    public List<CenterVO> searchCenter(Map<String, Object> map) throws Exception {
        return dao.searchCenter(map);
    }

    @Override
    public int getCenterMaxNum(int bizCode) throws Exception {
        return dao.getCenterMaxNum(bizCode);
    }

    @Override
    public void insertCenter(CenterVO center) throws Exception {
        dao.insertCenter(center);
    }

    @Override
    public void updateCenter(CenterVO center) throws Exception {
        dao.updateCenter(center);
    }

    @Override
    public void deleteCenter(CenterVO center) throws Exception {
        dao.deleteCenter(center);
    }

    @Override
    public List<CommonCodeVO> commonCodeEmail() throws Exception {
        return dao.commonCodeEmail();
    }

    @Override
    public List<CommonCodeVO> commonCodeUsage() throws Exception {
        return dao.commonCodeUsage();
    }
}
