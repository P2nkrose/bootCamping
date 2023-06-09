package com.bootCamping.mapperServiceImpl;

import com.bootCamping.domain.Board;
import com.bootCamping.domain.DTO.BoardDTO;
import com.bootCamping.domain.DTO.PageRequestDTO;
import com.bootCamping.domain.DTO.PageResponseDTO;
import com.bootCamping.domain.VO.BoardVO;
import com.bootCamping.mapper.BoardMapper;
import com.bootCamping.mapper.RippleMapper;
import com.bootCamping.mapperService.BoardService;
import com.bootCamping.mapperService.CustomerService;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.log4j.Log4j2;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


@Service
@Log4j2
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

    private final BoardMapper boardMapper;

    private final RippleMapper rippleMapper;
    private final CustomerService customerService;
    private final ModelMapper modelMapper;
    @Override
    public void addBoard(BoardDTO boardDTO, MultipartFile file) {
        log.info("addBoard()...");
        processForm(file, boardDTO);
        BoardVO boardVO = modelMapper.map(boardDTO,BoardVO.class);
        boardMapper.addBoard(boardVO);
        log.info(boardVO);

    }

    @SneakyThrows
    private void processForm(MultipartFile file, BoardDTO boardDTO) {
        String path = "c:/img/board/";

        File dir = new File(path);
        if(!dir.exists()){
            dir.mkdirs();
        }

        if(file != null && !file.isEmpty()){
            String imageName = UUID.randomUUID().toString() + file.getOriginalFilename();
            int imageSize = (int) file.getSize();
            log.info(imageName);

            boardDTO.setFilesize(imageSize);
            boardDTO.setFilename(imageName);
            file.transferTo(new File(path, imageName));
        }
    }

    @Override
    public List<Board> getListBoard() {
        log.info("getListBoard()...");
        List<Board> listBoard = boardMapper.getListBoard();
        return listBoard;
    }

    @Override
    public BoardDTO getOneBoard(int boardid) {
        log.info("getOneBoard()...");
        BoardDTO boardDTO = boardMapper.getOneBoard(boardid);
        boardDTO.setCustomerDTO(customerService.getOneCustomer(boardDTO.getCustomerid()));
        return boardDTO;
    }

    @Override
    public void updateBoard(BoardDTO boardDTO, MultipartFile file) {
        log.info("updateBoard()...");
        if(file.isEmpty() || file == null){
            String fileName = boardMapper.getOneBoard(boardDTO.getBoardid()).getFilename();
            boardDTO.setFilename(fileName);
        }
        processForm(file, boardDTO);
        BoardVO boardVO =modelMapper.map(boardDTO,BoardVO.class);
        boardMapper.updateBoard(boardVO);
    }

    @Override
    public void deleteBoard(int boardid) {
        log.info("deleteBoard()...");
        boardMapper.deleteBoard(boardid);
    }

    @Override
    public PageResponseDTO<BoardDTO> getList(PageRequestDTO pageRequestDTO) {
        log.info("page..........." + pageRequestDTO);
        List<BoardVO> voList = boardMapper.selectList(pageRequestDTO);
        List<BoardDTO> dtoList = new ArrayList<>();
        for(BoardVO boardVO : voList){
            BoardDTO todoDTO = modelMapper.map(boardVO, BoardDTO.class);
            todoDTO.setRipplecount(rippleMapper.rippleCount(todoDTO.getBoardid()));
            todoDTO.setCustomerDTO(customerService.getOneCustomer(todoDTO.getCustomerid()));
            dtoList.add(todoDTO);
        }
//        List<TodoDTO> dtoList = voList.stream()
//                .map(vo -> modelMapper.map(vo, TodoDTO.class))
//                .collect(Collectors.toList());
        int total = boardMapper.getCount(pageRequestDTO);

        PageResponseDTO<BoardDTO> pageResponseDTO = PageResponseDTO.<BoardDTO>withAll()
                .dtoList(dtoList)
                .total(total)
                .pageRequestDTO(pageRequestDTO)
                .build();

        return pageResponseDTO;
    }

    @Override
    public int rippleCount(int boardnum, int boardid) {
        int cnt = boardMapper.rippleCount(boardnum, boardid);
        return cnt;
    }

    @Override
    public void updateBoardRippleCount(int ripplecount, int boardid) {
        boardMapper.updateBoardRippleCount(ripplecount, boardid);
    }


}
