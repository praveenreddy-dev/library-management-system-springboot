package com.pluto.librarymanagmentsystemsb.repository;

import com.pluto.librarymanagmentsystemsb.entity.user_active;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface UserActiveRepository extends JpaRepository<user_active,Long> {
    @Transactional
    @Modifying
    @Query("update user_active u set u.name = ?1 where u.id = 1")
    void setActive(String name);
}
