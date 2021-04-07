# Trabalho 8 - Banco de Dados

## 1

Dado o pedido da venda e modelo E-R da solução, qual o psdeudo código esperado, num cenario em que o cliente colocou na "cesta de compras" num site de eCommerce uma série produtos e pede para finalizar o pedido, onde a transação deve:

- Gerar o pedido de venda
- Registrar cada item escolhido
- Para cada item incluso diminuir a quantidade do item do estoque do produto(Considerar na Entidade produto o atributo qtde estoque)
- O produto só pode ser aceito se o estoque não ficar negativo. Nesse caso, o ROLLBACK na transação, cancelando o pedido caso ocorra.

##### Implementar as tablelas no SGBD e escreva o algoritmo para tratar a transação pedida no item 1. Executando a inclusão de um pedido de duas formas:

- Transação bem sucedida
- Transação com erro (rollback) - Neste caso o pedido e as atualizações não são registradas no BD.

## 2

Quais as modificações que se propõe no modelo E-R e na lógica da transação quando se requer que o pedido seja só confirmado como "Pedido aceito e Pronto para entrega" após haver confirmação de pagamento via cartão de credito ou boleto bancario. Qual seria a proposta e assim resolver toda a questão de integridade e consistência da informação:

- Neste cenário, enquanto o Pedido não for pago, ele está no estado "Pedido Emitido Esperando pagamento"
- Após pagamento, pedido muda de estado para pedido aprovado
