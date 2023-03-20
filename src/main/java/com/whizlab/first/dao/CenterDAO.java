package com.whizlab.first.dao;

import com.whizlab.first.vo.CenterVO;
import com.whizlab.first.vo.CommonCodeVO;

import java.util.List;
import java.util.Map;

public interface CenterDAO {
    public List<CenterVO> centerList() throws Exception;
    public CenterVO centerView(int centerSeq) throws Exception;
    public List<CenterVO> searchCenter(Map<String, Object> map) throws Exception;
    public int getCenterMaxNum(int bizCode) throws Exception;

    public void insertCenter(CenterVO center) throws Exception;
    public void updateCenter(CenterVO center) throws Exception;
    public void deleteCenter(CenterVO center) throws Exception;

    public List<CommonCodeVO> commonCodeEmail() throws Exception;
    public List<CommonCodeVO> commonCodeUsage() throws Exception;
}
