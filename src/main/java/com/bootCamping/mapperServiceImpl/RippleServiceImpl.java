package com.bootCamping.mapperServiceImpl;

import com.bootCamping.domain.DTO.PageRequestDTO;
import com.bootCamping.domain.DTO.RippleDTO;
import com.bootCamping.domain.VO.RippleVO;
import com.bootCamping.mapper.RippleMapper;
import com.bootCamping.mapperService.CustomerService;
import com.bootCamping.mapperService.RippleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class RippleServiceImpl implements RippleService {

    private final ModelMapper modelMapper;
    private final RippleMapper rippleMapper;
    private final CustomerService customerService;

    @Override
    public void addRipple(RippleDTO rippleDTO) {
        log.info("addRipple()...");
        RippleVO rippleVO = modelMapper.map(rippleDTO, RippleVO.class);
        log.info(rippleVO);
        rippleMapper.addRipple(rippleVO);
        log.info(rippleVO);
    }

    @Override
    public List<RippleDTO> getListRipple(int boardnum) {
        log.info("getListRipple()...");
        List<RippleDTO> listRipple = rippleMapper.getListRipple(boardnum)
                .stream().map(m -> modelMapper.map(m, RippleDTO.class)).collect(Collectors.toList());
        for(RippleDTO list : listRipple) {
            list.setCustomerDTO(customerService.getOneCustomer(list.getCustomerid()));
        }
        return listRipple;
    }


    @Override
    public RippleDTO getOneRipple(int rippleid) {
        log.info("getOneRipple()...");
        RippleDTO rippleDTO = rippleMapper.getOneRipple(rippleid);
        rippleDTO.setCustomerDTO(customerService.getOneCustomer(rippleDTO.getCustomerid()));
        return rippleDTO;
    }

    @Override
    public void deleteRipple(int rippleid) {
        log.info("deleteRipple()...");
        rippleMapper.deleteRipple(rippleid);
    }

}
