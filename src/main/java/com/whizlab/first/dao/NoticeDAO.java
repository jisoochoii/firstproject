package com.whizlab.first.dao;

import com.whizlab.first.vo.FreeboardVO;
import com.whizlab.first.vo.NoticeVO;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface NoticeDAO {

    public List<NoticeVO> noticeList() throws Exception;

    public NoticeVO getNotice(int fbSeq) throws Exception;
}
