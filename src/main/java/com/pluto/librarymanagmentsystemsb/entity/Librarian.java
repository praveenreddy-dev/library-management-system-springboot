package com.pluto.librarymanagmentsystemsb.entity;

import jakarta.persistence.*;

@Entity
public class Librarian {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "username")
    private String username;

    public Librarian(String username, String name, String password) {
        this.username = username;
        this.name = name;
        this.password = password;
    }

    @Basic
    @Column(name = "name")
    private String name;
    @Basic
    @Column(name = "password")
    private String password;

    public Librarian() {

    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Librarian librarian = (Librarian) o;

        if (username != null ? !username.equals(librarian.username) : librarian.username != null) return false;
        if (name != null ? !name.equals(librarian.name) : librarian.name != null) return false;
        if (password != null ? !password.equals(librarian.password) : librarian.password != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = username != null ? username.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        return result;
    }
}
