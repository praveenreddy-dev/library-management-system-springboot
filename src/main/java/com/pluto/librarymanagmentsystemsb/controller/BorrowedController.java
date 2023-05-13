package com.pluto.librarymanagmentsystemsb.controller;

import com.pluto.librarymanagmentsystemsb.entity.Book;
import com.pluto.librarymanagmentsystemsb.entity.Borrowed;
import com.pluto.librarymanagmentsystemsb.entity.BorrowedRequest;
import com.pluto.librarymanagmentsystemsb.exception.NotFoundException;
import com.pluto.librarymanagmentsystemsb.service.BorrowedService;
import org.hibernate.Internal;
import org.hibernate.query.spi.StreamDecorator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Stream;

@Controller
public class BorrowedController {

    @Autowired
    BorrowedService borrowedService;

    @RequestMapping("/getBooksBorrowed")
    public String getPatrons(Model model){

        List<Borrowed> borrowedBooks = borrowedService.getBorrowed();
        Collections.reverse(borrowedBooks);
        model.addAttribute("booksBorrowed",borrowedBooks);
        return "issuedbooks";
    }
//    @GetMapping("/booksBorrowed")
//    public List<Borrowed> getBorrowed(){
//        return borrowedService.getBorrowed();
//    }

    @GetMapping("/booksBorrowed/{id}")
    public Borrowed getOneBook(@PathVariable int id){
        return borrowedService.getOneBorrowed(id);
    }

    @PostMapping("/borrowBook")
        public String addBorrowed(@RequestParam("bookId") int bookId, @RequestParam("patronEmail") String patronEmail, Model model){
        Borrowed book = new Borrowed();
        try{
            book = borrowedService.addingBorrowed(new BorrowedRequest(bookId, patronEmail));
        }catch (NotFoundException e){
            model.addAttribute("message", e.getMessage());
            return "error";
        }
        System.out.println("Borrowed: "+ book);
        return "redirect:/patronhome";
    }


    @GetMapping("/BorrowedBooks/search")
    public String searchBorrowed(@RequestParam("term") String term, Model model){
        //System.out.println(term);
        //Fetch all borrowed books from DB
        List<Borrowed> borrowedBooks = borrowedService.getBorrowed();
        //System.out.println(borrowedBooks.size());
        //Create an empty results list for the books that will match
        ArrayList<Borrowed> results = new ArrayList<>();

        //Create a stream to iterate and filter the borrowed books that match the search term
        Stream<Borrowed> borrowedStream = borrowedBooks.stream()

                .filter(b -> b.getPatronEmail().toLowerCase()
                        .contains(term.toLowerCase()) // that arrow lamda expresiion
                ||
                        b.getPatronName().toLowerCase()
                                .contains(term.toLowerCase()));

        //Stream of matched results
        borrowedStream.forEach(results::add);
        //borrowedStream.forEach(book -> results.add(book));
        model.addAttribute("books", results);
        return "searchResults";
    }

}




