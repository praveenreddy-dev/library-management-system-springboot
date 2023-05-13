package com.pluto.librarymanagmentsystemsb.service;

import com.pluto.librarymanagmentsystemsb.entity.Book;
import com.pluto.librarymanagmentsystemsb.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BookService {


    @Autowired
    BookRepository bookRepository;


    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }
    public Book getOneBook(int id) {
        return bookRepository.findById(id).orElseThrow(()->new RuntimeException("not found"));
    }

    public void addingBook(Book book) {
        bookRepository.save(book);
    }


    public Book updateBook(int id ,Book book) {
        Book originalBook =  bookRepository.findById(id).get();
        if(book==null){
            return null;
        }

        if(isWhole(book.getTitle())){
            originalBook.setTitle(book.getTitle());
        }
        if(isWhole(book.getAuthor())){
            originalBook.setAuthor(book.getAuthor());
        }
        if(isWhole(book.getPublishDate())){
            originalBook.setPublishDate(book.getPublishDate());
        }
        if(book.getAvaliable()>=0){
            originalBook.setAvaliable(book.getAvaliable());
        }
        if(isWhole(book.getDescription())){
            originalBook.setDescription(book.getDescription());
        }
        if(isWhole(book.getImage())){
            originalBook.setImage(book.getImage());
        }

        System.out.println("UPDATED DATA:"+originalBook);
        bookRepository.save(originalBook);
        return originalBook;
    }
    public static boolean isWhole(String field){
        return field!=null && !field.isEmpty();
    }


    public void deleteBook(int id) {
        bookRepository.delete(bookRepository.getReferenceById(id));
    }


    }


