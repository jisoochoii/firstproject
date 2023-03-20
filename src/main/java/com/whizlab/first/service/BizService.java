package com.whizlab.first.service;

import com.whizlab.first.vo.BizVO;
import com.whizlab.first.vo.BrandVO;
import com.whizlab.first.vo.CommonCodeVO;

import java.util.List;
import java.util.Map;

public interface BizService {
    public List<BizVO> bizList() throws Exception;
    public List<BizVO> selectCategory(Map<String, Object> map) throws Exception;
    public List<BizVO> searchTable(Map<String, Object> map) throws Exception;
    public BizVO bizViewList(int bizSeq) throws Exception;

    public List<BrandVO> brandList(int bizCode) throws Exception;
    public void saveBrand(BrandVO brand) throws Exception;
    public void deleteBrand(BrandVO brand) throws Exception;

    public int bizMaxNum(int bizCategory) throws Exception;
    public List<CommonCodeVO> commonCodeEmail() throws Exception;
    public List<CommonCodeVO> commonCodeRegion() throws Exception;
    public List<CommonCodeVO> commonCodeBank() throws Exception;
    public List<CommonCodeVO> commonCodeUsage() throws Exception;
    public List<CommonCodeVO> commonCodeCategory() throws Exception;

    public void insertBiz(BizVO biz) throws Exception;
    public void updateBiz(BizVO biz) throws Exception;
    public void deleteBiz(BizVO biz) throws Exception;
}
