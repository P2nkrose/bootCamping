package com.bootCamping.mapper;

import com.bootCamping.domain.Category;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {
    void addCategory(String category);

    Category getOneCategory(String categorytype);
}
