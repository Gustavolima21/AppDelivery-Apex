public with sharing class OrderDelivery {
    public enum OrderStatus {
        CARRINHO,
        EM_PROCESSAMENTO,
        ENTREGUE
    }

    Client client {get; set;}
    Restaurant restaurant {get; set;}
    List<OrderItemDelivery> itens;
    public OrderStatus status {get; set;}

    public OrderDelivery(Client client, Restaurant restaurant, List<OrderItemDelivery> itens, OrderStatus status) {
        this.client = client;
        this.restaurant = restaurant;
        this.itens = itens;
        this.status = status;
    }

    public void addProduct(Product newProduct, Integer quantity) {
        Boolean productExistMenu = false;
        Boolean productFoundOrders = false;

        for(Integer i = 0; i < restaurant.menu.size(); i++) {
            if(restaurant.menu[i].name == newProduct.name) {
                productExistMenu = true;
            }
        }
        
        if(productExistMenu) {
            for(Integer i = 0; i < itens.size(); i++) {
                if(itens[i].product.name == newProduct.name) {
                    System.debug('Este produto ja existe na lista e foi somada a quantidade');
                    productFoundOrders = true;
                    itens[i].quantity = itens[i].quantity + quantity;
                    break;
                }
            }

            if(!productFoundOrders) {
                OrderItemDelivery newItem = new OrderItemDelivery(newProduct, quantity);
                itens.add(newItem);
                System.debug('Produto Adicionado a lista de pedidos: ' + newItem);
            }
        } else {
            System.debug('Este produto não existe no restaurante');
        }
    }

    public Decimal calculateTotal() {
        Decimal totalValues = 0;

        for(Integer i = 0; i < itens.size(); i++) {
            totalValues = totalValues + itens[i].product.value * itens[i].quantity;
        }

        System.debug('Total da conta: R$' + totalValues);
        return totalValues;
    }
    
    public void confirmeOrder() {
        if(status == OrderStatus.CARRINHO && itens.size() > 0) {
            status = OrderStatus.EM_PROCESSAMENTO;
            System.debug('Pedido Confirmado!');
        } else {
            System.debug('Erro seu pedido não foi confirmado!');
        }
    }

    public void displaySummary() {
        System.debug('Cliente: ' + client.name + '\n' +
            'Restaurante: ' + restaurant.name + '\n' +
            'Lista de Itens: ' + itens + '\n' +
            'Status Pedido: ' + status
        );
    }
}