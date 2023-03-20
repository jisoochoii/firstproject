package com.whizlab.first.service;

import com.whizlab.first.vo.ClaimVO;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

public interface ClaimService {

    public List<ClaimVO> claimList(int claCustomer) throws Exception;

    public int getMaxClaSeq() throws Exception;

    public void claimInsert(ClaimVO claimVO) throws Exception;

    public ClaimVO viewClaim(int claSeq) throws Exception;
}
