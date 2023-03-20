package com.whizlab.first.dao;

import com.whizlab.first.vo.PageVO;
import com.whizlab.first.vo.ThumbnailVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ThumbnailDAOImpl implements ThumbnailDAO{
    @Autowired
    private SqlSession session;

    private static final String namespace = "com.whizlab.tnb";

    @Override
    public List<ThumbnailVO> thumbnailList(PageVO vo) throws Exception {
        vo.setPageNum(0);
        return session.selectList(namespace + ".tnbList", vo);
    }

    @Override
    public ThumbnailVO thumbnailViewList(int tnbSeq) throws Exception {
        return (ThumbnailVO) session.selectOne(namespace + ".tnbViewList", tnbSeq);
    }

    @Override
    public void thumbnailInsert(ThumbnailVO tnb) throws Exception {
        session.insert(namespace + ".tnbInsert", tnb);
    }

    @Override
    public void thumbnailUpdate(ThumbnailVO tnb) throws Exception {
        session.update(namespace + ".tnbUpdate", tnb);
    }

    @Override
    public void thumbnailDel(int tnbSeq) throws Exception {
        session.update(namespace + ".tnbDel", tnbSeq);
    }

    @Override
    public int getTotal(PageVO vo) {
        return session.selectOne(namespace+".getTotal", vo);
    }
}
