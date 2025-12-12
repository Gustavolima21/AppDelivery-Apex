
* **Objetivo:** sincronizar a existência e os dados de `AccountTeamMember__c` com as alterações realizadas em `AssociatedLocation__c` de forma automática e segura.
* **Principais comportamentos:**

  * **Insert:** ao criar um `AssociatedLocation__c`, é criado um `AccountTeamMember__c` apontando para o mesmo Usuário e Conta, desde que não exista já outro `AccountTeamMember__c` com o mesmo par Conta–Usuário.
  * **Delete:** ao excluir um `AssociatedLocation__c`, o `AccountTeamMember__c` correspondente é removido apenas se não existirem outras `AssociatedLocation__c` vinculadas ao mesmo par Conta–Usuário.
  * **Update:** se um `AssociatedLocation__c` tiver sua Conta ou Usuário alterados, o `AccountTeamMember__c` relacionado é atualizado para refletir tais mudanças.

---

## Tecnologias

* Apex (Triggers, Trigger Handler)
* SOQL / DML
* Salesforce Platform (custom objects)

---

## Boas práticas aplicadas

* **Bulkification:** todas as operações foram projetadas para tratar listas e evitar limites de governança.
* **Uso eficiente de SOQL/DML:** consultas e DML otimizados, reduzindo chamadas desnecessárias.
* **Coleções:** uso de `Map<Id, List<SObject>>`, `Set<Id>` e `List<SObject>` para agrupar e processar dados em lote.
* **Arquitetura:** organização via *Trigger Handler* para separar lógica de negócio, favorecendo manutenção e testabilidade.
* **Validações:** checagens explícitas para impedir duplicidades e exclusões indevidas.





