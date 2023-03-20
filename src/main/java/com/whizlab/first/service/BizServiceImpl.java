package com.whizlab.first.service;

import com.whizlab.first.dao.BizDAO;
import com.whizlab.first.vo.BizVO;
import com.whizlab.first.vo.BrandVO;
import com.whizlab.first.vo.CommonCodeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BizServiceImpl implements BizService {

    @Autowired
    private BizDAO dao;

    @Override
    public List<BizVO> bizList() throws Exception {
        return dao.bizList();
    }

    @Override
    public List<BizVO> selectCategory(Map<String, Object> map) throws Exception {
        return dao.selectCategory(map);
    }

    @Override
    public List<BizVO> searchTable(Map<String, Object> map) throws Exception {
        return dao.searchTable(map);
    }

    @Override
    public BizVO bizViewList(int bizSeq) throws Exception {
        return dao.bizViewList(bizSeq);
    }

    @Override
    public List<BrandVO> brandList(int bizCode) throws Exception {
        return dao.brandList(bizCode);
    }

    @Override
    public void saveBrand(BrandVO brand) throws Exception {
        dao.saveBrand(brand);
    }

    @Override
    public void deleteBrand(BrandVO brand) throws Exception {
        dao.deleteBrand(brand);
    }

    @Override
    public int bizMaxNum(int bizCategory) throws Exception {
        return dao.bizMaxNum(bizCategory);
    }

    @Override
    public List<CommonCodeVO> commonCodeEmail() throws Exception {
        return dao.commonCodeEmail();
    }

    @Override
    public List<CommonCodeVO> commonCodeRegion() throws Exception {
        return dao.commonCodeRegion();
    }

    @Override
    public List<CommonCodeVO> commonCodeBank() throws Exception {
        return dao.commonCodeBank();
    }

    @Override
    public List<CommonCodeVO> commonCodeUsage() throws Exception {
        return dao.commonCodeUsage();
    }

    @Override
    public List<CommonCodeVO> commonCodeCategory() throws Exception {
        return dao.commonCodeCategory();
    }

    @Override
    public void insertBiz(BizVO biz) throws Exception {
        dao.insertBiz(biz);
    }

    @Override
    public void updateBiz(BizVO biz) throws Exception {
        dao.updateBiz(biz);
    }

    @Override
    public void deleteBiz(BizVO biz) throws Exception {
        dao.deleteBiz(biz);
    }
}
