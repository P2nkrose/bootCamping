package com.bootCamping.mapperService;

import com.bootCamping.domain.DTO.MenuDTO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface MenuService {
    void insert(MenuDTO menuDTO,MultipartFile file);
    MenuDTO getOne(int mid);
    List<MenuDTO> list();
    List<MenuDTO> admin();
    void modify(MenuDTO menuDTO);
    void remove(Long mid);

}
