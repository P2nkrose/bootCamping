package com.bootCamping.mapperServiceImpl;

import com.bootCamping.domain.Category;
import com.bootCamping.mapper.CategoryMapper;
import com.bootCamping.mapperService.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {

    private final CategoryMapper categoryMapper;

    @Override
    public void addCategory(String categorytype) {
        categoryMapper.addCategory(categorytype);
    }

    @Override
    public Category getOneCategory(String categorytype) {
        return categoryMapper.getOneCategory(categorytype);
    }
}
