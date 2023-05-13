package com.pluto.librarymanagmentsystemsb.entity;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class user_active {
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "name")
    private String name;

    @Basic
    @Column(name = "email")
    private String email;

    public user_active(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public user_active(int id, String name, String email) {
        this.id = id;
        this.name = name;
        this.email = email;
    }
    public user_active() {

    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
