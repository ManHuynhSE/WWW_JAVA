package iuh.fit.bai03.model;

public class Product {
    private int id;
    private String model;
    private double price;
    private int quantity;
    private String description;
    private String imgurl;
    public Product() {
    }

    public Product(int id, String model, double price, int quantity, String description,String imgurl) {
        this.id = id;
        this.model = model;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.imgurl = imgurl;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
