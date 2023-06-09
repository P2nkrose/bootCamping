package com.bootCamping.mapperService;

import com.bootCamping.domain.DTO.PageRequestDTO;
import com.bootCamping.domain.DTO.RippleDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RippleService {
    void addRipple(RippleDTO rippleDTO);

    List<RippleDTO> getListRipple(int boardnum);

    RippleDTO getOneRipple(int rippleid);

    void deleteRipple(int rippleid);
}
