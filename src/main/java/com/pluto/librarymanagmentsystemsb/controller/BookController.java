package com.pluto.librarymanagmentsystemsb.controller;

import com.pluto.librarymanagmentsystemsb.entity.Book;
import com.pluto.librarymanagmentsystemsb.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class BookController {

    @Autowired
    BookService bookService;

    // changes in this page are : newly added one /new👇 and // submitNew is also added newly // and there is one part isComplete in Book.java for submitNew
    @RequestMapping("/new")
    public String newBook(Model model){
        return "new";
    }

    /*@GetMapping("/books")
    public List<Book> getAllBooks(){
        return bookService.getAllBooks();
    }
*/


    @PostMapping("/submitNew")
    public String addBook(@ModelAttribute("book") Book book, Model model) {
    if (book == null) {
        model.addAttribute("error_message", "Book values not received");
        return "new";
    }
    if (!book.isComplete()) {
        model.addAttribute("error_message", "All fields are required");
        return "new";
    }
    bookService.addingBook(book);
    model.addAttribute("success_message", "Added " + book.getTitle() + " successfully");
    return "new";

}
    @GetMapping ("/delete")
    public String delete(@RequestParam("id") int id) {
        System.out.println("hey");

        bookService.deleteBook(id);
        return "redirect:/home"; // redirect to the list of books
    }
     @GetMapping("/view")
     public String view(@RequestParam("id") int id , Model model){

        Book book = bookService.getOneBook(id);
         model.addAttribute("book", book);
         return "view";
     }
    @GetMapping ("/search")
    public String search(@RequestParam("id") int id, Model model) {
        System.out.println("IN CONTROLLER");

        Book book =  bookService.getOneBook(id);
        model.addAttribute("book", book);
        return  "redirect:/view?id="+book.getId(); // show the book details using the "view" view
    }

    @GetMapping("/edit/{id}")
    public String getEditPage(@PathVariable("id") int id, Model model){
        Book book = bookService.getOneBook(id);

        model.addAttribute("book", book);
         return "edit";
    }

    @PostMapping("/submitEdit")
    public String submitEdit(@ModelAttribute Book book){
        bookService.updateBook(book.getId(), book);
        return "redirect:/view?id="+book.getId();
    }

}


