public with sharing class Client {
    public String name {get; set;}
    public String cpf {get; set;}
    public String address {get; set;}
    public String phone {get; set;}

    
    public Client(String name, String cpf, String address, String phone) {
        this.name = name;
        this.cpf = cpf;
        this.address = address;
        this.phone = phone;
    }
}