package com.bootCamping.mapper;

import com.bootCamping.domain.Cart;
import com.bootCamping.domain.DTO.CartDTO;
import com.bootCamping.domain.VO.CartVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CartMapper {
    void insertCart(CartVO cartVO);

    List<CartVO> selectCart(int cid);

    CartDTO purchaseCart(int cartid);

    void deleteCart(int cartid);


}