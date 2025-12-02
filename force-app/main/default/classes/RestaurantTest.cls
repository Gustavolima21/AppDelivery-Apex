@isTest public with sharing class RestaurantTest {

    @isTest 
    static void testAddProduct() {
        Restaurant restaurant = new Restaurant(
            'Bella Pizza',
            Restaurant.RestaurantCategory.Pizzaria,
            new List<Product>()
        );

        restaurant.addProduct(new Product('Pizza mussarela', 50));
        System.assertEquals(1, restaurant.menu.size());

        restaurant.addProduct(new Product('Pizza mussarela', 50));
        System.assertEquals(1, restaurant.menu.size(), 'Produto Duplicado não foi possivel Adicionar!');

        restaurant.addProduct(new Product('Refrigerante', 5));
        System.assertEquals(2, restaurant.menu.size());
    }

    @isTest
    static void testRemoveProduct() {
        Restaurant restaurant = new Restaurant(
            'Bella Pizza',
            Restaurant.RestaurantCategory.Pizzaria,
    		new List<Product>{
                new Product('Pizza calabressa', 10),
                new Product('Pizza mussarela', 10)
            }
        );

        restaurant.removeProduct('Pizza mussarela');
        System.assertEquals(1, restaurant.menu.size());

        restaurant.removeProduct('Pizza portuguesa');
        System.assertEquals(1, restaurant.menu.size());
    }

    @isTest
    static void testMenuDisplay() {
        Restaurant restaurant1 = new Restaurant(
            'Bella Pizza',
            Restaurant.RestaurantCategory.Pizzaria,
            new List<Product>()
        );

        restaurant1.menuDisplay();
        System.assertEquals(false, restaurant1.menuDisplay(), 'Cardápio vazio');

        restaurant1.addProduct(new Product('Pizza mussarela', 50));
        restaurant1.addProduct(new Product('Refrigerante', 5));

        restaurant1.menuDisplay();
        System.assertEquals(2, restaurant1.menu.size());
    }

    @isTest
    static void testSearchProducts() {
        Restaurant restaurant1 = new Restaurant(
            'Bella Pizza',
            Restaurant.RestaurantCategory.Pizzaria,
            new List<Product>{
                new Product('Pizza mussarela', 10),
                new Product('Pizza calabresa', 20)
            }
        );

        List<String> products = restaurant1.searchProducts('Pizza');
        List<String> productsSought = new List<String>{'Pizza mussarela', 'Pizza calabresa'};
        System.assertEquals(productsSought, products);

        products = restaurant1.searchProducts('CALABRESA');
        productsSought = new List<String>{'Pizza calabresa'};
        System.assertEquals(productsSought, products);

        products = restaurant1.searchProducts('Batata');
        productsSought = new List<String>{};
        System.assertEquals(productsSought, products);
    }
}