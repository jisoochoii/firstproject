package com.whizlab.first.service;

import com.whizlab.first.dao.ThumbnailDAO;
import com.whizlab.first.vo.PageVO;
import com.whizlab.first.vo.ThumbnailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ThumbnailServiceImpl implements ThumbnailService{
    @Autowired
    private ThumbnailDAO dao;

    @Override
    public List<ThumbnailVO> thumbnailList(PageVO vo) throws Exception {
        return dao.thumbnailList(vo);
    }

    @Override
    public ThumbnailVO thumbnailViewList(int tnbSeq) throws Exception {
        return dao.thumbnailViewList(tnbSeq);
    }

    @Override
    public void thumbnailInsert(ThumbnailVO tnb) throws Exception {
        dao.thumbnailInsert(tnb);
    }

    @Override
    public void thumbnailUpdate(ThumbnailVO tnb) throws Exception {
        dao.thumbnailUpdate(tnb);
    }

    @Override
    public void thumbnailDel(int tnbSeq) throws Exception {
        dao.thumbnailDel(tnbSeq);
    }

    @Override
    public int getTotal(PageVO vo) {
        return dao.getTotal(vo);
    }
}
