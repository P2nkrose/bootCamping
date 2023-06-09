package com.bootCamping.mapper;

import com.bootCamping.domain.Board;
import com.bootCamping.domain.DTO.BoardDTO;
import com.bootCamping.domain.DTO.PageRequestDTO;
import com.bootCamping.domain.VO.BoardVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BoardMapper {

    void addBoard(BoardVO boardVO);

    List<Board> getListBoard();

    BoardDTO getOneBoard(int boardid);

    void updateBoard(BoardVO boardVO);

    void deleteBoard(int boardid);

    List<BoardVO> selectList(PageRequestDTO pageRequestDTO);

    int getCount(PageRequestDTO pageRequestDTO);

    int rippleCount(int boardnum, int boardid);

    void updateBoardRippleCount(int ripplecount, int boardid);
}
