public with sharing class OrderItemDelivery {
    public Product product {get; set;}
    public Integer quantity {get; set;}

    public OrderItemDelivery(Product product, Integer quantity) {
        this.product = product;
        this.quantity = quantity;
    }
}