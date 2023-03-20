package com.whizlab.first.service;

import com.whizlab.first.dao.FreeboardDAO;
import com.whizlab.first.dao.NoticeDAO;
import com.whizlab.first.vo.FreeboardVO;
import com.whizlab.first.vo.NoticeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService{
    @Autowired
    private NoticeDAO dao;

    @Override
    public List<NoticeVO> noticeList() throws Exception {
        return dao.noticeList();
    }

    @Override
    public NoticeVO getNotice(int fbSeq) throws Exception{
        return dao.getNotice(fbSeq);
    }
}
