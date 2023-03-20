package com.whizlab.first.service;

import com.whizlab.first.vo.PageVO;
import com.whizlab.first.vo.ThumbnailVO;

import java.util.List;
import java.util.Map;

public interface ThumbnailService {
    public List<ThumbnailVO> thumbnailList(PageVO vo) throws Exception;
    public ThumbnailVO thumbnailViewList(int tnbSeq) throws Exception;
    public void thumbnailInsert(ThumbnailVO tnb)throws Exception;
    public void thumbnailUpdate(ThumbnailVO tnb)throws Exception;
    public void thumbnailDel(int tnbSeq)throws Exception;
    public int getTotal(PageVO vo);
}
