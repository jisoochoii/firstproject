package com.whizlab.first.service;

import com.whizlab.first.vo.MenuVO;

import java.util.List;

public interface MenuService {
    public List<MenuVO> menuList() throws Exception;
    public List<MenuVO> menuUpperList() throws Exception;
    public void insertMenu(MenuVO menu) throws Exception;
}
