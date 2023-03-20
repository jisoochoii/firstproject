package com.whizlab.first.service;

import com.whizlab.first.dao.ClaimDAO;
import com.whizlab.first.vo.ClaimVO;
import com.whizlab.first.vo.PageVO;
import com.whizlab.first.vo.ThumbnailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClaimServiceImpl implements ClaimService{
    @Autowired
    private ClaimDAO dao;

    @Override
    public List<ClaimVO> claimList(int claCustomer) throws Exception {
        return dao.claimList(claCustomer);
    }

    @Override
    public int getMaxClaSeq() throws Exception {
        return dao.getMaxClaSeq();
    }

    @Override
    public void claimInsert(ClaimVO claimVO) throws Exception{
        dao.claimInsert(claimVO);
    }

    @Override
    public ClaimVO viewClaim(int claSeq) throws Exception{
        return dao.viewClaim(claSeq);
    }
}
