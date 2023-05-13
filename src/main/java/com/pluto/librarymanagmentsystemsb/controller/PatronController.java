package com.pluto.librarymanagmentsystemsb.controller;

import com.pluto.librarymanagmentsystemsb.entity.*;
import com.pluto.librarymanagmentsystemsb.entity.Patron;
import com.pluto.librarymanagmentsystemsb.service.BookService;
import com.pluto.librarymanagmentsystemsb.service.BorrowedService;
import com.pluto.librarymanagmentsystemsb.service.LibrarianService;
import com.pluto.librarymanagmentsystemsb.service.PatronService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class PatronController {
    @Autowired
    private PatronService patronService;
    @Autowired
    private BookService bookService;
    @Autowired
    private LibrarianService librarianService;
    @Autowired
    BorrowedService borrowedService;



    /* These to are redirects for patron login and patron add in home jsp */
    @RequestMapping("/patronlogin") //// neeeded bro don't delete
    public String login(Model model) {
        return "patronlogin";
    }

    @RequestMapping("/newpatron")
    public String newBook(Model model){
        return "patronadded";
    }

    @RequestMapping("/getPatrons")
    public String getPatrons(Model model){
        return "";
    }




    /*Here you used these controllers to save the patron in librarian page means "home.jsp" for add patron button */
  @PostMapping("/patronsave")
  public String addPatron(@RequestParam("name") String name,
                          @RequestParam("email") String email,
                          @RequestParam("password") String password,
                          Model model) {
      Patron patron = new Patron(name, email, password);
      patronService.addingPatron(patron);

      model.addAttribute("success_message", "Added " + patron.getName() + " successfully");
      return "redirect:/home";
  }



    /*Here you used these controllers for patron login - jsp you have used is index page to add patron button and patron console to login*/
    @PostMapping("/patronlogin1")
    public String login(@RequestParam("email") String email, @RequestParam("password") String password, Model model){

        Patron patron = patronService.fetchOne(email.toLowerCase().trim());
//       Patron patron=  patronService.authenticatePatron(patron);
        if(patron==null){
            model.addAttribute("message","User doesn't exist");
            return "error";
        } else if (!patron.getPassword().equals(password)) {
            model.addAttribute("message","The password you entered was incorrect");
            return "error";
        }
        librarianService.setActive(patron.getName(), patron.getEmail());
        return "redirect:/patronhome";
  }

    @GetMapping("/patronhome")
    public String getconsole (Model model){
        List<Book> books = bookService.getAllBooks();
        Collections.reverse(books);
        user_active user = librarianService.getActiveUser();
        ArrayList<Borrowed> borrowed = (ArrayList<Borrowed>) borrowedService.getOneBorrowedEmail(user.getEmail());
        model.addAttribute("books",books);

        if(borrowed==null)
            model.addAttribute("borrowed",new ArrayList<>());
        else
            model.addAttribute("borrowed", borrowed);

        model.addAttribute("name",user.getName());
        model.addAttribute("email",user.getEmail());
        return "patronconsole";
    }




   /* //not used yet
    @GetMapping("/patron/{email}")
    public Patron getonePatron(@PathVariable String email){
        return patronService.getOnePatron(email);
    }

    @GetMapping("/getallpatron")
    public List<Patron> getAllpatron(){
        return  patronService.getAllPatrons();
    }*/


}
