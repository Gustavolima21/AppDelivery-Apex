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

    public void removeProduct(String productName) {
        for(Integer i = 0; i < menu.size(); i++) {
            if(menu[i].name == productName) {
                System.debug('Produto removido: ' + menu[i]);
                menu.remove(i);
            }else {
                System.debug('Este produto não foi encontrado!');
            }
        }
    }

    public Boolean menuDisplay() {
        Boolean menuExisting = false;

        if(menu.size() > 0) {
            for(Integer i = 0; i < menu.size(); i++) {
                System.debug((i + 1) +'.' + menu[i].name + ' - ' + 'R$'+ menu[i].value);   
            }   
            menuExisting = true;
        } else {
            System.debug('Menu Vazio!');
        }

        System.debug(menuExisting);
        return menuExisting;
    }

    public List<String> searchProducts(String productName) {
        List<String> foundProducts = new List<String>();
        
        for(Integer i = 0; i < menu.size(); i++) {
            if(menu[i].name.toLowerCase().contains(productName.toLowerCase())) {
                foundProducts.add(menu[i].name);
            }
        }

        if(foundProducts.isEmpty()) {
            System.debug('Produto não encontrado para ' + productName );
        } 
        
        return foundProducts;
    }
}