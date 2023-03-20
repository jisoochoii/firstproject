package com.whizlab.first.service;

import com.whizlab.first.vo.FreeboardVO;
import com.whizlab.first.vo.NoticeVO;

import java.util.List;

public interface NoticeService {

    public List<NoticeVO> noticeList() throws Exception;

    public NoticeVO getNotice(int fbSeq) throws Exception;
}
