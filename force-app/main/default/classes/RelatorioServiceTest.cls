@isTest
public with sharing class RelatorioServiceTest {

    @isTest
    static void testBestSellingProductsReport() {
        List<OrderItemDelivery> orderItens = new List<OrderItemDelivery>{
            new OrderItemDelivery(new Product('Pizza Mussarela', 50), 2),
            new OrderItemDelivery(new Product('Pizza Calabresa', 50), 1),
            new OrderItemDelivery(new Product('Pizza Mussarela', 50), 3),
            new OrderItemDelivery(new Product('Refrigerante', 5), 1),
            new OrderItemDelivery(new Product('Pizza Mussarela', 50), 2),
            new OrderItemDelivery(new Product('Refrigerante', 5), 2)
        };

        Restaurant restaurant1 = new Restaurant(
            'Bella Pizza',
            Restaurant.RestaurantCategory.Pizzaria,
    		new List<Product>{
                new Product('Pizza Mussarela', 50),
                new Product('Pizza Calabresa', 40),
                new Product('Refrigerante', 5)
            }
        );

        RelatorioService relatorioService = new RelatorioService();

        relatorioService.generateReportBestProducts(orderItens);
    }

    @isTest
    static void testCustomerOrderReport() {
        RelatorioService relatorioService = new RelatorioService();

        Restaurant restaurant1 = new Restaurant(
            'Bella Pizza',
            Restaurant.RestaurantCategory.Pizzaria,
    		new List<Product>{
                new Product('Pizza Mussarela', 50),
                new Product('Pizza Calabresa', 40),
                new Product('Refrigerante', 5)
            }
        );

        Client client1 = new Client(
            'Ana',
            '123.456.789-00',
            'Rua Central, 123',
            'Rua Central, 123'
        );

        Client client2 = new Client(
            'Carlos',
            '987.654.321-00',
            'Rua das Flores, 45',
            '(11) 98888-7777'
        );

        List<OrderItemDelivery> orderItens = new List<OrderItemDelivery>{
            new OrderItemDelivery(new Product('Pizza calabressa', 50), 2),
            new OrderItemDelivery(new Product('Pizza portuguesa', 50), 5),
            new OrderItemDelivery(new Product('Pizza calabressa', 50), 2)
        };

        List<OrderItemDelivery> orderItens2 = new List<OrderItemDelivery>{
            new OrderItemDelivery(new Product('Pizza calabressa', 50), 2),
            new OrderItemDelivery(new Product('Pizza portuguesa', 50), 5)
        };

        List<OrderDelivery> orderClient = new List<OrderDelivery>{
            new OrderDelivery(client1, restaurant1, orderItens, OrderDelivery.OrderStatus.CARRINHO),
            new OrderDelivery(client2, restaurant1, orderItens2, OrderDelivery.OrderStatus.CARRINHO) 
        };

        List<String> cpfClients = new List<String>{
            '123.456.789-00',
            '565.231.234-99',
            '987.654.321-00',
            '333.231.234-99'
        };

        relatorioService.generateCustomerOrderReport(restaurant1, orderClient, cpfClients);
    }
}