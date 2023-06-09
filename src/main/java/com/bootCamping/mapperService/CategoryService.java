package com.bootCamping.mapperService;

import com.bootCamping.domain.Category;
import com.bootCamping.mapper.CategoryMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

public interface CategoryService {

    void addCategory(String categorytype);

    Category getOneCategory(String categorytype);

}
