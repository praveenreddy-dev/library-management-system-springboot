package com.pluto.librarymanagmentsystemsb.repository;


import com.pluto.librarymanagmentsystemsb.entity.Patron;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PatronRepository extends JpaRepository<Patron,Integer> {

    Patron findByEmail(String email);
}
