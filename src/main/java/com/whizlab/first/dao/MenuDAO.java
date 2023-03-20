package com.whizlab.first.dao;

import com.whizlab.first.vo.MenuVO;

import java.util.List;

public interface MenuDAO {
    public List<MenuVO> menuList() throws Exception;
    public List<MenuVO> menuUpperList() throws Exception;
    public void insertMenu(MenuVO menu) throws Exception;
}
