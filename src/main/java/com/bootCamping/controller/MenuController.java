package com.bootCamping.controller;

import com.bootCamping.domain.DTO.MenuDTO;
import com.bootCamping.mapperService.MenuService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;


@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/menu")
public class MenuController {


    private final MenuService menuService;

    @GetMapping("/addMenu")
    public String addMenuController(HttpSession session) {

        if(session.getAttribute("admin") == null){
            return "redirect:/admin/login";
        }
        return "/menu/addMenu";
    }

    @PostMapping("/addMenu")
    public String addMenuController(@Valid MenuDTO menuDTO,
                                    BindingResult bindingResult,
                                    HttpSession session,
                                    RedirectAttributes redirectAttributes,
                                    MultipartFile file) {
        log.info("addMenu......");
        log.info(file);
        log.info(menuDTO);
        if (session.getAttribute("admin")==null){
            redirectAttributes.addFlashAttribute("error", bindingResult.getAllErrors());
            return "redirect:/customer/login";
        }
        if (bindingResult.hasErrors()) {
            log.info("has error");
            redirectAttributes.addFlashAttribute("error", bindingResult.getAllErrors());
            return "redirect:/menu/addMenu";
        }
        menuService.insert(menuDTO,file);
        redirectAttributes.addFlashAttribute("registerOk", "register_ok");
        return "redirect:/menu/adminMenu";
    }

    @GetMapping("/readMenu")
    public void readMenuController(int mid, Model model) {
        MenuDTO menuDTO = menuService.getOne(mid);
        log.info(menuDTO);

        model.addAttribute("dto", menuDTO);
    }


    @GetMapping("/modifyMenu")
    public void modifyController(int mid, Model model) {
        MenuDTO menuDTO = menuService.getOne(mid);
        log.info(menuDTO);

        model.addAttribute("dto", menuDTO);
    }

    @PostMapping("/modifyMenu")
    public String modifyMenuController(@Valid MenuDTO menuDTO,
                                       BindingResult bindingResult,
                                       RedirectAttributes redirectAttributes) {
        log.info("--------modify--------");
        if (bindingResult.hasErrors()) {
            log.info("has error...");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addAttribute("tno", menuDTO.getMid());
            return "redirect:/menu/modifyMenu";
        }
        log.info(menuDTO);
        menuService.modify(menuDTO);

        redirectAttributes.addAttribute("name", menuDTO.getName());
        redirectAttributes.addAttribute("menuType", menuDTO.getMenutype());
        redirectAttributes.addAttribute("price", menuDTO.getPrice());

        return "redirect:/menu/adminMenu";
    }

    @GetMapping("/removeMenu")
    public String delete(@RequestParam("mid") Long mid) {
        log.info("------ remove ------");
        log.info("mid : " + mid);


        menuService.remove(mid);

        return "redirect:/menu/adminMenu";
    }


    @GetMapping("/listMenu")
    public void list(Model model) {
        model.addAttribute("dto", menuService.list());
    }

    @GetMapping("/adminMenu")
    public void admin(Model model) {
        model.addAttribute("dto2", menuService.list());
    }

    @GetMapping("/getOneMenu")
    public void getOneMenu(int mid, Model model, HttpServletRequest request){
        HttpSession session =request.getSession();
        MenuDTO menuDTO = menuService.getOne(mid);
        model.addAttribute("dto",menuDTO);
    }
}


















