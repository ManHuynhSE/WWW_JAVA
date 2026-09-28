package iuh.fit.bai03.model;

import java.util.ArrayList;
import java.util.List;

public class CartBean {
    private List<CartItemBean> items;


    public CartBean() {
        this.items = new ArrayList<>();
    }

    public List<CartItemBean> getItems() {
        return items;
    }

    public void addItems(Product p) {
        for(CartItemBean itemBean: items) {
            if(itemBean.getProduct().getId() == p.getId()) {
                itemBean.setQuantity(itemBean.getQuantity()+1);
                return;
            }
        }
        items.add(new CartItemBean(p,1));
    }

    public void removeProduct(int productId) {
        items.removeIf(item -> item.getProduct().getId() == productId);
    }

    public void updateQuantity(int productId, int quantity) {
             for (CartItemBean item : items) {
                  if (item.getProduct().getId() == productId) {
                       if (quantity > 0) {
                           item.setQuantity(quantity);
                   } else {
                           // nếu nhập <= 0 thì xóa luôn sản phẩm
                           removeProduct(productId);
                      }
                       return;
                 }
              }
        }


     public double getTotal() {
          double total = 0;
          for (CartItemBean item : items) {
              total += item.getSubTotal();
           }
           return total;
       }


      public void clear() {
          items.clear();
     }
}
