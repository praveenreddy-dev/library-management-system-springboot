package com.pluto.librarymanagmentsystemsb.service;

import com.pluto.librarymanagmentsystemsb.entity.Book;
import com.pluto.librarymanagmentsystemsb.entity.Patron;
import com.pluto.librarymanagmentsystemsb.entity.Patron;
import com.pluto.librarymanagmentsystemsb.repository.BookRepository;
import com.pluto.librarymanagmentsystemsb.repository.PatronRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class PatronService {

    @Autowired 
    private PatronRepository patronRepository;


    public void addingPatron(Patron patron) {
        patronRepository.save(patron);
    }

    public Patron getOnePatron(String email) {
        return Optional.ofNullable(patronRepository.findByEmail(email)).get();

    }

    public List<Patron> getAllPatrons() {
        return patronRepository.findAll();
    }

    public Patron fetchOne(String email) {
        return patronRepository.findByEmail(email);
    }


}
