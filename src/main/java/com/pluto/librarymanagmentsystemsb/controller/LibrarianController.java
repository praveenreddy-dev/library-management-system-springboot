package com.pluto.librarymanagmentsystemsb.controller;

import com.pluto.librarymanagmentsystemsb.entity.Book;
import com.pluto.librarymanagmentsystemsb.entity.Librarian;
import com.pluto.librarymanagmentsystemsb.service.BookService;
import com.pluto.librarymanagmentsystemsb.service.LibrarianService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class LibrarianController {


    @Autowired
    LibrarianService librarianService;

    @Autowired
    BookService bookService;


    @GetMapping("/home")
   public String getHome (Model model){

      List<Book> books = bookService.getAllBooks();

      String username = librarianService.getActive();
      Collections.reverse(books);
      model.addAttribute("books",books);
      model.addAttribute("name",username);
      System.out.println(username);

      return "home";
   }

    @PostMapping("/login")
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, Model model){

        Librarian librarian = librarianService.fetchOne(username.toLowerCase().trim());

        if(librarian==null){
            model.addAttribute("message","User doesn't exist");
            return "error";
        } else if (!librarian.getPassword().equals(password)) {
            model.addAttribute("message","The password you entered was incorrect");
            return "error";
        }
        librarianService.setActive(librarian.getName());

        return "redirect:/home";


}}
