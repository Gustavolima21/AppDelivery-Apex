public with sharing class Product {
    public String name {get; set;}
    public Decimal value {get; set;}

    public Product(String name, Decimal value) {
        this.name = name;
        this.value = value;
    }
}