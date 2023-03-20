package com.whizlab.first.dao;

import com.whizlab.first.vo.ClaimVO;
import com.whizlab.first.vo.ThumbnailVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ClaimDAOImpl implements ClaimDAO{

    @Autowired
    private SqlSession session;

    private static final String namespace = "com.whizlab.cla";

    @Override
    public List<ClaimVO> claimList(int claCustomer) throws Exception{
        return session.selectList(namespace + ".claimList", claCustomer);
    }

    @Override
    public int getMaxClaSeq() throws Exception{
        int result = session.selectOne(namespace + ".getMaxClaSeq");
        if(result == 0 ){
            result = 1;
        }
        return result;
    }

    @Override
    public void claimInsert(ClaimVO claimVO) throws Exception{
        session.insert(namespace + ".claimInsert", claimVO);
    }

    @Override
    public ClaimVO viewClaim(int claSeq) throws Exception{
        return (ClaimVO) session.selectOne(namespace + ".getClaim", claSeq);
    }
}
