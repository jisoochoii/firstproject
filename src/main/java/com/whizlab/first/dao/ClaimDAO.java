package com.whizlab.first.dao;

import com.whizlab.first.vo.ClaimVO;

import java.util.List;

public interface ClaimDAO {

    public List<ClaimVO> claimList(int claCustomer) throws Exception;

    public int getMaxClaSeq() throws Exception;

    public void claimInsert(ClaimVO claimVO) throws Exception;

    public ClaimVO viewClaim(int claSeq) throws Exception;
}
