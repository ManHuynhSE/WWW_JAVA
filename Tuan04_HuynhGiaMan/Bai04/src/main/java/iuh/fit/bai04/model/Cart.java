package iuh.fit.bai04.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<CartItem> items;

    public Cart() {
        this.items = new ArrayList<>();
    }

    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }

    public void addItem(Book b) {
        for(CartItem item : items) {
            if(item.getBook().getId()==b.getId()) {
                item.setQuantity(item.getQuantity()+1);
                return;
            }
        }
        items.add(new CartItem(b,1));
    }

    public void remove(int id) {
        for(CartItem item : items) {
            if(item.getBook().getId()==id) {
                items.remove(item);
                return;
            }
        }
    }
    public double getTotal() {
        double total = 0;
        for(CartItem item : items) {
            total+= item.getTotal();
        }
        return total;
    }

    public int getSize() {
        return items.size();
    }

}
