package com.whizlab.first.service;

import com.whizlab.first.dao.MenuDAO;
import com.whizlab.first.vo.MenuVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService{
    @Autowired
    private MenuDAO dao;

    @Override
    public List<MenuVO> menuList() throws Exception {
        return dao.menuList();
    }

    @Override
    public List<MenuVO> menuUpperList() throws Exception {
        return dao.menuUpperList();
    }

    @Override
    public void insertMenu(MenuVO menu) throws Exception {
        dao.insertMenu(menu);
    }
}
