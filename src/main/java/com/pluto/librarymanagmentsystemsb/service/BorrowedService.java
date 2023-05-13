package com.pluto.librarymanagmentsystemsb.service;

import com.pluto.librarymanagmentsystemsb.entity.Book;
import com.pluto.librarymanagmentsystemsb.entity.Borrowed;
import com.pluto.librarymanagmentsystemsb.entity.BorrowedRequest;
import com.pluto.librarymanagmentsystemsb.entity.Patron;
import com.pluto.librarymanagmentsystemsb.exception.NotFoundException;
import com.pluto.librarymanagmentsystemsb.repository.BookRepository;
import com.pluto.librarymanagmentsystemsb.repository.BorrowedRepository;
import com.pluto.librarymanagmentsystemsb.repository.PatronRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.text.html.Option;
import java.sql.Date;
import java.util.List;
import java.util.Optional;

@Service
public class BorrowedService {


    @Autowired
    BorrowedRepository borrowedRepository;

    @Autowired
    BookRepository bookRepository;

    @Autowired
    PatronRepository patronRepository;

    public List<Borrowed> getBorrowed() {
        return borrowedRepository.findAll();
    }


    public Borrowed getOneBorrowed(int id) {
        return borrowedRepository.findById(id).orElseThrow(()->new RuntimeException("not found"));
    }

    public Borrowed addingBorrowed(BorrowedRequest borrowed) throws NotFoundException {

        Optional<Book> optionalBook =  bookRepository.findById(borrowed.getBookId());

        if(optionalBook.isEmpty()){
            throw new NotFoundException("Book not found");
        }else if(optionalBook.get().getAvaliable()<=0){
            throw new NotFoundException("Sorry no books available, Please come again later! ");
        }

        Optional<Patron> optionalPatron;

        // if the patron email was provided then we fetch the patron using email
        // else fetch by id
        if(borrowed.getPatronEmail()!=null && !borrowed.getPatronEmail().isEmpty()){
            optionalPatron =  Optional.of(patronRepository.findByEmail(borrowed.getPatronEmail()));
        }
        else {
            optionalPatron = patronRepository.findById(borrowed.getPatronId());
        }


        if(optionalPatron.isEmpty()) {
            throw new NotFoundException("Patron doesn't exit");
        }
        Book book = optionalBook.get();
        book.setAvaliable(book.getAvaliable()-1);

        Borrowed borrowedBook = new Borrowed();
        borrowedBook.setPatronName(optionalPatron.get().getName());
        borrowedBook.setPatronEmail(optionalPatron.get().getEmail());
        borrowedBook.setBorrowedDate(new Date(System.currentTimeMillis()));
        borrowedBook.setBookName(optionalBook.get().getTitle());

        borrowedRepository.save(borrowedBook);
        return borrowedBook;


    }

    public List<Borrowed> getOneBorrowedEmail(String email) {
        return borrowedRepository.findAllByPatronEmail(email);
    }
}
