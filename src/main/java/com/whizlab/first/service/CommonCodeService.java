package com.whizlab.first.service;

import com.whizlab.first.vo.CommonCodeVO;
import com.whizlab.first.vo.MainCommonVO;

import java.util.List;

public interface CommonCodeService {
    public List<MainCommonVO> mainCommonList() throws Exception;
    public List<CommonCodeVO> commonCodeList(int commonCodeType) throws Exception;
    public int commonMaxNum(int commonCodeType) throws Exception;

    public void mainCodeInsert(MainCommonVO main) throws Exception;
    public void mainCodeDelete(MainCommonVO main) throws Exception;

    public  void commonCodeInsert(CommonCodeVO common) throws Exception;
    public  void commonCodeDelete(CommonCodeVO common) throws Exception;
}
