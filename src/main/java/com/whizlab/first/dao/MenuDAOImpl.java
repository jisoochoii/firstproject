package com.whizlab.first.dao;

import com.whizlab.first.vo.MenuVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MenuDAOImpl implements MenuDAO{
    @Autowired
    private SqlSession session;

    private static final String namespace = "com.whizlab.menu";

    @Override
    public List<MenuVO> menuList() throws Exception {
        return session.selectList(namespace+".menuList");
    }

    @Override
    public List<MenuVO> menuUpperList() throws Exception {
        return session.selectList(namespace+".menuUpperList");
    }

    @Override
    public void insertMenu(MenuVO menu) throws Exception {
        session.insert(namespace+".insertMenu", menu);
    }
}
