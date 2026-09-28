package iuh.fit.bai04.model;

public class Book {
    private int id;
    private String title;
    private String author;
    private String imgbook;

    public Book() {
    }

    public Book(int id, String title, String author, String imgbook) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.imgbook = imgbook;
    }

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

    public String getImgbook() {
        return imgbook;
    }

    public void setImgbook(String imgbook) {
        this.imgbook = imgbook;
    }
}
