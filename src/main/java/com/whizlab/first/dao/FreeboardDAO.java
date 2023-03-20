package com.whizlab.first.dao;


import com.whizlab.first.vo.FreeboardVO;

import java.util.List;

public interface FreeboardDAO {
    public List<FreeboardVO> fbList() throws Exception;
    public FreeboardVO fbViewList(int fbSeq) throws Exception;
    public void fbInsert(FreeboardVO fb) throws Exception;
    public void fbUpdate(FreeboardVO fb) throws Exception;
    public void fbDel(int fbSeq) throws Exception;
}
