package com.pluto.librarymanagmentsystemsb.entity;

import jakarta.persistence.*;

import java.sql.Date;

@Entity
public class Borrowed {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "patron_name")
    private String patronName;
    @Basic
    @Column(name = "patron_email")
    private String patronEmail;
    @Basic
    @Column(name = "book_name")
    private String bookName;
    @Basic
    @Column(name = "borrowed_date")
    private Date borrowedDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPatronName() {
        return patronName;
    }

    public void setPatronName(String patronName) {
        this.patronName = patronName;
    }

    public String getPatronEmail() {
        return patronEmail;
    }

    public void setPatronEmail(String patronEmail) {
        this.patronEmail = patronEmail;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Date getBorrowedDate() {
        return borrowedDate;
    }

    public void setBorrowedDate(Date borrowedDate) {
        this.borrowedDate = borrowedDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Borrowed borrowed = (Borrowed) o;

        if (id != borrowed.id) return false;
        if (patronName != null ? !patronName.equals(borrowed.patronName) : borrowed.patronName != null) return false;
        if (patronEmail != null ? !patronEmail.equals(borrowed.patronEmail) : borrowed.patronEmail != null)
            return false;
        if (bookName != null ? !bookName.equals(borrowed.bookName) : borrowed.bookName != null) return false;
        if (borrowedDate != null ? !borrowedDate.equals(borrowed.borrowedDate) : borrowed.borrowedDate != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (patronName != null ? patronName.hashCode() : 0);
        result = 31 * result + (patronEmail != null ? patronEmail.hashCode() : 0);
        result = 31 * result + (bookName != null ? bookName.hashCode() : 0);
        result = 31 * result + (borrowedDate != null ? borrowedDate.hashCode() : 0);
        return result;
    }
}
