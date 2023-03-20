package com.whizlab.first.service;

import com.whizlab.first.dao.CommonCodeDAO;
import com.whizlab.first.vo.CommonCodeVO;
import com.whizlab.first.vo.MainCommonVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommonCodeServiceImpl implements CommonCodeService{
    @Autowired
    private CommonCodeDAO dao;

    @Override
    public List<MainCommonVO> mainCommonList() throws Exception {
        return dao.mainCommonList();
    }

    @Override
    public List<CommonCodeVO> commonCodeList(int commonCodeType) throws Exception {
        return dao.commonCodeList(commonCodeType);
    }

    @Override
    public int commonMaxNum(int commonCodeType) throws Exception {
        return dao.commonMaxNum(commonCodeType);
    }

    @Override
    public void mainCodeInsert(MainCommonVO main) throws Exception {
        dao.mainCodeInsert(main);
    }

    @Override
    public void mainCodeDelete(MainCommonVO main) throws Exception {
        dao.mainCodeDelete(main);
    }

    @Override
    public void commonCodeInsert(CommonCodeVO common) throws Exception {
        dao.commonCodeInsert(common);
    }

    @Override
    public void commonCodeDelete(CommonCodeVO common) throws Exception {
        dao.commonCodeDelete(common);
    }
}
