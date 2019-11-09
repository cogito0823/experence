package VO;

import java.io.InputStream;

public class shoppingCart {
    private int quangtity;
    private int book_id;
    public shoppingCart(){

    }

    public shoppingCart(String u,double p,int n,int bid){
        this.book_id=bid;
        this.quangtity=n;
    }


    public int getQuangtity() {
        return quangtity;
    }

    public void setQuangtity(int quangtity) {
        this.quangtity = quangtity;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }
    
}