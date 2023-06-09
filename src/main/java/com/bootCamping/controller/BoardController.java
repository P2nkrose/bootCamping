package com.bootCamping.controller;

import com.bootCamping.domain.Board;
import com.bootCamping.domain.DTO.BoardDTO;
import com.bootCamping.domain.DTO.PageRequestDTO;
import com.bootCamping.domain.VO.BoardVO;
import com.bootCamping.mapperService.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;


@Controller
@Log4j2
@RequestMapping("/customer/board")
@RequiredArgsConstructor
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/addBoard")
    public String addBoardGET(HttpSession session) {
        session.getAttribute("customer");
        if (session.getAttribute("customer") == null){
            return "redirect:/customer/login";
        }
        return "/customer/board/addBoard";
    }

    @PostMapping("/addBoard")
    public String addBoardPOST(BoardDTO boardDTO, @RequestParam("file") MultipartFile file, HttpSession session) {
        if (session.getAttribute("customer") == null) {
            return "redirect:/customer/login";
        }
        log.info("POST addBoard...");
        log.info(boardDTO.getContent());

        // HTML 태그를 제거하여 텍스트만 얻는다
//        String plainText = Jsoup.clean(boardDTO.getContent(), Whitelist.none());
//        boardDTO.setContent(plainText);

        boardService.addBoard(boardDTO, file);
        return "redirect:/customer/board/getListBoard";
    }

//    @GetMapping("/getListBoard")
//    public void getListBoard(Model model) {
//        log.info("list...");
//        List<Board> list = boardService.getListBoard();
//
//        model.addAttribute("list", list);
//    }

    @GetMapping({"/getOneBoard", "/updateBoard"})
    public void getOneBoard(int boardid, Model model) {
        log.info("OneBoard...");
        log.info(boardid);
        BoardDTO boardDTO = boardService.getOneBoard(boardid);
        log.info(boardDTO);

        model.addAttribute("board", boardDTO);
    }

    @PostMapping("/updateBoard")
    public String updateBoardPOST(BoardDTO boardDTO, @RequestParam("file") MultipartFile file) {
        log.info("updateBoardPOST...");

        // HTML 태그를 제거하여 텍스트만 얻는다
//        String plainText = Jsoup.clean(boardDTO.getContent(), Whitelist.none());
//        boardDTO.setContent(plainText);

        boardService.updateBoard(boardDTO, file);
        return "redirect:/customer/board/getOneBoard?boardid=" + boardDTO.getBoardid();
    }

    @GetMapping("deleteBoard")
    public String deleteBoard(int boardid) {
        log.info("deleteBoard");
        boardService.deleteBoard(boardid);
        return "redirect:/customer/board/getListBoard";
    }



    @GetMapping("/getListBoard")
    public void list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, Model model){
        log.info(pageRequestDTO);

        if(bindingResult.hasErrors()){
            pageRequestDTO = PageRequestDTO.builder().build();
        }
        log.info(pageRequestDTO);
        model.addAttribute("responseDTO",boardService.getList(pageRequestDTO));
        log.info(boardService.getList(pageRequestDTO));
    }



}



