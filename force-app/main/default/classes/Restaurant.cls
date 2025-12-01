public with sharing class Restaurant {
    public enum RestaurantCategory {
        Pizzaria,
        Lanchonete,
        Japones,
        Hamburgueria,
        Outros
    }

    public String name {get; set;}
    public RestaurantCategory category {get; set;} 
    public List<Product> menu {get; set;}
     
    public Restaurant(String name, RestaurantCategory category, List<Product> menu) {
        this.name = name;
        this.category = category;
        this.menu = menu;
    }

    public void addProduct(Product product) {
        Boolean productExisting = false;

         for(Integer i = 0; i < menu.size(); i++) {
            if(menu[i].name == product.name) {
                productExisting = true;
            }
        }

        if(productExisting) {
            System.debug('Esse produto ja existe!');
        } else {
            menu.add(product);
            System.debug('Produto Adicionado!');
        }
    }

    public void menuDisplay() {
        for(Integer i = 0; i < menu.size(); i++) {
            System.debug((i + 1) +'.' + menu[i].name + ' - ' + 'R$'+ menu[i].value);
        }
    }

    public List<Product> searchProducts(String productName) {
        List<Product> foundProducts = new List<Product>();
        for(Integer i = 0; i < menu.size(); i++) {
            if(menu[i].name == productName) {
                foundProducts.add(menu[i]);
            }
        }

        if(!foundProducts.isEmpty()) {
            System.debug('Produto encontrado!');
            return foundProducts; 
        } else {
            System.debug('Produto não encontrado!');
            return foundProducts;
        }
    }
}