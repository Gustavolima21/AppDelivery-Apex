public with sharing class RelatorioService {
    public RelatorioService() {}

    public Map<Product, Integer> generateReportBestProducts(List<OrderItemDelivery> products) {
        List<OrderItemDelivery> totalProductQuantity = new List<OrderItemDelivery>();
        Map<Product, Integer> bestSellingProducts = new Map<Product, Integer>();
        
        for(Integer i= 0; i < products.size(); i++) {
            Boolean productNotFound = false;
            if(totalProductQuantity.size() > 0) {
                for(Integer j = 0; j < totalProductQuantity.size(); j++) {
                    if(products[i].product.name == totalProductQuantity[j].product.name) {
                        productNotFound = false;
                        totalProductQuantity[j].quantity += products[i].quantity;
                        break;
                    } else {
                        productNotFound = true;
                    }
                }

                if(productNotFound) {
                    totalProductQuantity.add(products[i]);
                }   
            } else {
                totalProductQuantity.add(products[i]);
            }
        }

        while(!totalProductQuantity.isEmpty()) {
            OrderItemDelivery oldItem = totalProductQuantity[0];
            Integer oldIndex = 0;

            for(Integer i= 0; i < totalProductQuantity.size(); i++) {
                if(oldItem.quantity < totalProductQuantity[i].quantity) {
                    oldItem = totalProductQuantity[i];
                    oldIndex = i;
                } 
            }

            bestSellingProducts.put(oldItem.product, oldItem.quantity);
            totalProductQuantity.remove(oldIndex);
        }

        Integer numericalOrder = 1;
        System.debug('Top 3 produtos mais vendidos:');
        for(Product product : bestSellingProducts.keySet()) {
            System.debug(numericalOrder + '. ' + product.name + ' - ' + bestSellingProducts.get(product) + ' Unidades');
            numericalOrder++;
        }

        return bestSellingProducts;
    }

    public Map<String, List<OrderItemDelivery>> generateCustomerOrderReport(Restaurant restaurant, List<OrderDelivery> orderClient, List<String> cpfs) {
        Map<String, List<OrderItemDelivery>> ordersCustomer = new Map<String, List<OrderItemDelivery>>();

        for(Integer i = 0; i < orderClient.size(); i++) {
            if(orderClient[i].restaurant.name == restaurant.name) {
                if(cpfs.contains(orderClient[i].client.cpf)) {
                    ordersCustomer.put(orderClient[i].client.cpf, orderClient[i].itens);
                }
            }
        }

        for(String cpf : ordersCustomer.keySet()) {
            System.debug(
                'Client: ' + cpf + ' - ' + ordersCustomer.get(cpf).size() + ' Pedidos'
            );
        }
        
        return ordersCustomer;
    }
}