package com.whizlab.first.service;

import com.whizlab.first.dao.FreeboardDAO;
import com.whizlab.first.vo.FreeboardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FreeboardServiceImpl implements FreeboardService{

    @Autowired
    private FreeboardDAO dao;

    @Override
    public List<FreeboardVO> fbList() throws Exception {
        return dao.fbList();
    }

    @Override
    public FreeboardVO fbViewList(int fbSeq) throws Exception {
        return dao.fbViewList(fbSeq);
    }

    @Override
    public void fbInsert(FreeboardVO fb) throws Exception {
        dao.fbInsert(fb);
    }

    @Override
    public void fbUpdate(FreeboardVO fb) throws Exception {
        dao.fbUpdate(fb);
    }

    @Override
    public void fbDel(int fbSeq) throws Exception {
        dao.fbDel(fbSeq);
    }
}
