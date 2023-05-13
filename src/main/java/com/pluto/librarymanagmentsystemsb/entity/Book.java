package com.pluto.librarymanagmentsystemsb.entity;

import jakarta.persistence.*;

@Entity
public class Book {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "title")
    private String title;
    @Basic
    @Column(name = "author")
    private String author;
    @Basic
    @Column(name = "publish_date")
    private String publishDate;
    @Basic
    @Column(name = "avaliable")
    private int avaliable;
    @Basic
    @Column(name = "description")
    private String description;
    @Basic
    @Column(name = "image")
    private String image;




//    @ManyToOne
//    private Patron patron;

    public Book() {

    }

 /*   public Patron getPatron() {
        return patron;
    }

    public void setPatron(Patron patron) {
        this.patron = patron;
    }

    public Book(Patron patron) {
        this.patron = patron;
    }
*/





    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    public int getAvaliable() {
        return avaliable;
    }

    public void setAvaliable(int avaliable) {
        this.avaliable = avaliable;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", publishDate='" + publishDate + '\'' +
                ", avaliable=" + avaliable +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Book book = (Book) o;

        if (id != book.id) return false;
        if (avaliable != book.avaliable) return false;
        if (title != null ? !title.equals(book.title) : book.title != null) return false;
        if (author != null ? !author.equals(book.author) : book.author != null) return false;
        if (publishDate != null ? !publishDate.equals(book.publishDate) : book.publishDate != null) return false;
        if (description != null ? !description.equals(book.description) : book.description != null) return false;
        if (image != null ? !image.equals(book.image) : book.image != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (author != null ? author.hashCode() : 0);
        result = 31 * result + (publishDate != null ? publishDate.hashCode() : 0);
        result = 31 * result + avaliable;
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (image != null ? image.hashCode() : 0);
        return result;
    }


    //THIS ONE ADDED FOR /submitNew controller
    public boolean isComplete(){
        System.out.println(this);
        if(title==null || author==null || publishDate==null )
            return false;
        return !title.isEmpty() && !author.isEmpty() && !publishDate.isEmpty() ;
    }
}
