public with sharing class Restaurant {
    public enum RestaurantCategory {
        Pizzaria,
        Lanchonete,
        Japones,
        Hamburgueria,
        Outros
    }

    String name {get; set;}
    RestaurantCategory category {get; set;} 
    List<Product> menu {get; set;}
     
    public Restaurant(String name, RestaurantCategory category, List<Product> menu) {
        this.name = name;
        this.category = category;
        this.menu = menu;
    }
}