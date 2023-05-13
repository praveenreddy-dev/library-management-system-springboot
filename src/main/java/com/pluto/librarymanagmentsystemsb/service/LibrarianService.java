package com.pluto.librarymanagmentsystemsb.service;

import com.pluto.librarymanagmentsystemsb.entity.Librarian;
import com.pluto.librarymanagmentsystemsb.entity.user_active;
import com.pluto.librarymanagmentsystemsb.repository.LibrarianRepository;
import com.pluto.librarymanagmentsystemsb.repository.UserActiveRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Optional;

import org.springframework.web.bind.annotation.GetMapping;

@Service
public class LibrarianService {

    //47 and 39 --doubt

    @Autowired
    LibrarianRepository librarianRepository;

    @Autowired
    UserActiveRepository userActiveRepository;



    //changed for active user in librarian

    public String getActive() {
        user_active userActive = userActiveRepository.findById(1L).orElse(new user_active());
        return userActive.getName();
    }

    public user_active getActiveUser() {
        return userActiveRepository.findById(1L).orElse(new user_active());
    }


    public void setActive(String name, String email) {
        user_active userActive = userActiveRepository.findById(1L).orElse(new user_active());
        userActive.setId(1);
        userActive.setName(name);
        userActive.setEmail(email);
        userActiveRepository.save(userActive);
    }

    public void setActive(String name) {
        user_active userActive = userActiveRepository.findById(1L).orElse(new user_active());
        userActive.setId(1);
        userActive.setName(name);
        userActiveRepository.save(userActive);
    }

    public Librarian fetchOne(String username) {
        return librarianRepository.findByUsername(username);
    }

}
