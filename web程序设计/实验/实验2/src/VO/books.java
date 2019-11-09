package VO;
import java.io.*;

/**
 * 在书籍信息录入时，书籍图片存放地址的修改在setPhotoPath()
 * 中同时getFileInputStream()也要设置
 */
public class books {
    private int bookId;
    private String name;
    private String category_id;
    private String photoPath;
    private String author;
    private String information;
    private double price;

    public books(){

    }

    //初始化书籍信息
    public books(String name,String category,String photoPath,
                 String author,String information,float price){
        this.name=name;
        this.category_id=category;
        this.author=author;
        this.information=information;
        this.price=price;
        this.photoPath=photoPath;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory_id() {
        return category_id;
    }

    public void setCategory_id(String category_id) {
        this.category_id = category_id;
    }

    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}