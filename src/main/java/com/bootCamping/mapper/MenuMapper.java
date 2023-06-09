package com.bootCamping.mapper;

import com.bootCamping.domain.VO.MenuVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MenuMapper {
    void insertMenu(MenuVO menuVO);

    MenuVO getOneMenu(int mid);

    List<MenuVO> listMenu();

    List<MenuVO> adminMenu();

    void modifyMenu(MenuVO menuVO);

    void removeMenu(Long mid);
}
