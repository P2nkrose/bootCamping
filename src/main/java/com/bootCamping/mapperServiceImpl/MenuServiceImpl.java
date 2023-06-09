package com.bootCamping.mapperServiceImpl;

import com.bootCamping.domain.DTO.BoardDTO;
import com.bootCamping.domain.DTO.MenuDTO;
import com.bootCamping.domain.VO.MenuVO;
import com.bootCamping.mapper.MenuMapper;
import com.bootCamping.mapperService.MenuService;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
@Log4j2
@RequiredArgsConstructor
public class MenuServiceImpl implements MenuService {

    private final MenuMapper menuMapper;
    private final ModelMapper modelMapper;

    @Override
    public void insert(MenuDTO menuDTO, MultipartFile file) {
        log.info("menuService Insert...");
        processForm(file, menuDTO);
        MenuVO menuVO = modelMapper.map(menuDTO, MenuVO.class);
        log.info(menuVO);
        menuMapper.insertMenu(menuVO);
    }


    @SneakyThrows
    private static void processForm(MultipartFile file, MenuDTO menuDTO) {
        String path = "c:/img/menu/";

        File dir = new File(path);
        if(!dir.exists()){
            dir.mkdirs();
        }

        if(file != null && !file.isEmpty()){
            String imageName = UUID.randomUUID().toString() + file.getOriginalFilename();
            int imageSize = (int) file.getSize();
            log.info(imageName);

            menuDTO.setFilesize(imageSize);
            menuDTO.setFilename(imageName);
            file.transferTo(new File(path, imageName));
        }
    }

    @Override
    public MenuDTO getOne(int mid) {
        log.info("menuService getOne...");
        MenuDTO menuDTO = modelMapper.map(menuMapper.getOneMenu(mid), MenuDTO.class);
        return menuDTO;
    }

    @Override
    public List<MenuDTO> list() {
        List<MenuVO> voList = menuMapper.listMenu();
        List<MenuDTO> dtoList = new ArrayList<>();
        for(MenuVO menuVO : voList){
            MenuDTO dto = modelMapper.map(menuVO, MenuDTO.class);
            dtoList.add(dto);
        }
        return dtoList;
    }

    @Override
    public List<MenuDTO> admin() {
        List<MenuVO> voList = menuMapper.adminMenu();
        List<MenuDTO> dtoList = new ArrayList<>();
        for(MenuVO menuVO : voList){
            MenuDTO dto = modelMapper.map(menuVO, MenuDTO.class);
            dtoList.add(dto);
        }
        return dtoList;
    }

    @Override
    public void modify(MenuDTO menuDTO) {
        log.info("menuService Modify...");
        MenuVO menuVO = modelMapper.map(menuDTO, MenuVO.class);
        log.info(menuVO);
        menuMapper.modifyMenu(menuVO);
    }

    @Override
    public void remove(Long mid) {
        menuMapper.removeMenu(mid);
    }
}
















