package com.pluto.librarymanagmentsystemsb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping("/welcome")
    public String index() {
        System.out.println("hey i am in ");
        return "index";
    }

}
