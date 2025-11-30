public with sharing class Product {
    String name {get; set;}
    Double value {get; set;}

    public Product(String name, Double value) {
        this.name = name;
        this.value = value;
    }
}