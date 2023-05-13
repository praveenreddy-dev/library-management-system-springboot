package com.pluto.librarymanagmentsystemsb.entity;

public class BorrowedRequest {

    private int patronId;
    private int bookId;
    private String patronEmail;

    public String getPatronEmail() {
        return patronEmail;
    }

    public BorrowedRequest(int bookId, String patronEmail) {
        this.bookId = bookId;
        this.patronEmail = patronEmail;
    }

    public void setPatronEmail(String patronEmail) {
        this.patronEmail = patronEmail;
    }

    public int getPatronId() {
        return patronId;
    }

    public void setPatronId(int patronId) {
        this.patronId = patronId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }
}
