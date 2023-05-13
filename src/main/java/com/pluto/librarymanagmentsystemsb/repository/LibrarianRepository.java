package com.pluto.librarymanagmentsystemsb.repository;

import com.pluto.librarymanagmentsystemsb.entity.Librarian;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LibrarianRepository extends JpaRepository <Librarian,Long> {
    Librarian findByUsername(String username);

}
