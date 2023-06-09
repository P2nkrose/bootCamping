package com.bootCamping.mapperService;

import com.bootCamping.domain.Board;
import com.bootCamping.domain.DTO.BoardDTO;
import com.bootCamping.domain.DTO.PageRequestDTO;
import com.bootCamping.domain.DTO.PageResponseDTO;
import com.bootCamping.domain.VO.BoardVO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public interface BoardService {

    void addBoard(BoardDTO boardDTO, MultipartFile file);

    List<Board> getListBoard();

    BoardDTO getOneBoard(int boardid);

    void updateBoard(BoardDTO boardDTO, MultipartFile file);

    void deleteBoard(int boardid);

    PageResponseDTO<BoardDTO> getList(PageRequestDTO pageRequestDTO);

    int rippleCount(int boardnum, int boardid);

    void updateBoardRippleCount(int ripplecount, int boardid);
}
