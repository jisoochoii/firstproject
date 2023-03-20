package com.whizlab.first.dao;

import com.mysql.cj.protocol.x.Notice;
import com.whizlab.first.vo.FreeboardVO;
import com.whizlab.first.vo.NoticeVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class NoticeDAOImpl implements NoticeDAO{
    @Autowired
    private SqlSession session;

    private static final String namespace = "com.whizlab.notice";

    public List<NoticeVO> noticeList() throws Exception{
        List<FreeboardVO> noList = session.selectList( namespace + ".noticeList");
        return session.selectList( namespace + ".noticeList");
    }

    public NoticeVO getNotice(int fbSeq) throws Exception{
        //NoticeVO notice =
        return session.selectOne(namespace + ".getNotice", fbSeq);
    }
}
