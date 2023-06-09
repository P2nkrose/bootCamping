package com.bootCamping.mapper;

import com.bootCamping.domain.DTO.PageRequestDTO;
import com.bootCamping.domain.DTO.RippleDTO;
import com.bootCamping.domain.Ripple;
import com.bootCamping.domain.VO.RippleVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RippleMapper {
    void addRipple(RippleVO rippleVO);

    List<RippleVO> getListRipple(int boardnum);

    RippleDTO getOneRipple(int rippleid);

    void deleteRipple(int rippleid);

    int rippleCount(int boardnum);
}
