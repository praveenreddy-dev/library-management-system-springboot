package com.pluto.librarymanagmentsystemsb.repository;

import com.pluto.librarymanagmentsystemsb.entity.Borrowed;
import com.pluto.librarymanagmentsystemsb.entity.Patron;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BorrowedRepository extends JpaRepository<Borrowed,Integer> {
    List<Borrowed> findAllByPatronEmail(String email);
}
