package com.bootCamping.mapperService;

import com.bootCamping.domain.DTO.BoardDTO;
import com.bootCamping.domain.DTO.CartDTO;
import com.bootCamping.domain.VO.CartVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public interface CartService {
    void addCart(CartDTO cartDTO);

    List<CartDTO> selectCart(int cid);

    List<CartDTO> purchaseCart(String cartIds);

    void deleteCart(int cartid);
}