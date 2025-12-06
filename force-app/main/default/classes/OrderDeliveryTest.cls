@isTest
public with sharing class OrderDeliveryTest {
    @isTest 
    static void testCreateOrderWithValidProducts() {
        Client client = new client(
            'Ana',
            '123.456.789-00',
            'Rua Central, 123',
            '"(11) 99999-8888'
        );

        Restaurant restaurant = new Restaurant(
            'Bella Pizza',
            Restaurant.RestaurantCategory.Pizzaria,
            new List<Product>{
                new Product('Pizza Mussarela', 35.00),
                new Product('Pizza Calabresa', 38.00),
                new Product('Refrigerante', 8.00)
            }
        );

        List<OrderItemDelivery> itens = new List<OrderItemDelivery>();

        OrderDelivery delivery = new OrderDelivery(
            client,
            restaurant,
            itens,
            OrderDelivery.OrderStatus.CARRINHO
        );

        delivery.addProduct(new Product('Pizza Mussarela', 35.00), 2);
        delivery.addProduct(new Product('Refrigerante', 8.00), 1);
        System.assertEquals(2, itens.size());

        delivery.displaySummary();
        delivery.calculateTotal();
        System.assertEquals(78, delivery.calculateTotal());

        delivery.confirmeOrder();
        System.assertEquals(OrderDelivery.OrderStatus.EM_PROCESSAMENTO, delivery.status);
    }

    @isTest
    static void testAddInvalidProduct() {
        Client client = new client(
            'Ana',
            '123.456.789-00',
            'Rua Central, 123',
            '"(11) 99999-8888'
        );

        Restaurant restaurant = new Restaurant(
            'Bella Pizza',
            Restaurant.RestaurantCategory.Pizzaria,
            new List<Product>{
                new Product('Pizza Mussarela', 35.00),
                new Product('Pizza Calabresa', 38.00),
                new Product('Refrigerante', 8.00)
            }
        );

        List<OrderItemDelivery> itens = new List<OrderItemDelivery>();

        OrderDelivery delivery1 = new OrderDelivery(
            client,
            restaurant,
            itens,
            OrderDelivery.OrderStatus.CARRINHO
        );

        delivery1.addProduct(new Product('Pastel', 10.00), 2);
        System.assertEquals(0, itens.size());

        delivery1.confirmeOrder();
        System.assertEquals(OrderDelivery.OrderStatus.CARRINHO, delivery1.status);

        delivery1.addProduct(new Product('Pizza Calabresa', 38.00), 1);
        System.assertEquals(1, itens.size());

        delivery1.confirmeOrder();
        System.assertEquals(OrderDelivery.OrderStatus.EM_PROCESSAMENTO, delivery1.status);
        
        delivery1.displaySummary();
    }
}