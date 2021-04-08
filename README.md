# Trabalho 8 - Banco de Dados

## Peso 2,0 – Apresentar dia 13/04/2021 a solução (questão 1 sendo executada) e proposta para resposta a questão 2

## Mande para robertogbrasil@gmail.com  o PDF com a proposta de solução (modelo E-R e pseudo(s) código(s) para as questões 1 e 2 pedidas.

## Apresentação
 - Passo 1 – Apresente o algoritmo com a lógica construída, apontando claramente onde começa e onde termina a transação
 - Passo 2 – Realize consulta SQL no banco, para mostrar que o Pedido a ser inserido não existe ainda
 - Passo 3 – Execute o caso da transação OK , criando um Pedido, com pelo menos três produtos diferentes
 - Passo 4 – Execute a consulta para mostrar que o Pedido foi inserido com sucesso
 - Passo 5 – Execute o caso da transação com falhas. Neste ponto, tente inserir um pedido com pelo menos três produtos diferentes.  O erro deverá ocorrer quando tentar registrar o segundo produto (nesse momento, as atualizações anteriores foram feitas OK)
 - Passo 6 – Execute a consulta para mostrar que o Pedido não foi inserido
 - Passo 7 – Apresente a proposta de solução quanto a questão 2.

## Instruções para o trabalho

### 1
Dado pedido de venda e modelo E-R da solução,  dado o roteiro abaixo,  num cenário em que o cliente colocou na “cesta de compras” num site de e-Commerce uma série de produtos e pede para Finalizar o Pedido, onde a transação  deve:

- Gerar o pedido de venda;
- Registrar cada item escolhido;
- Para cada item incluso diminuir a quantidade do Item do Estoque do produto  (Considerar na Entidade Produto o atributo  qtdeEstoque);
- O produto só pode ser aceito se o estoque não ficar negativo. Nesse caso, ROLLBACK na transação, cancelando o pedido, caso ocorra;

##### Implemente as tabelas no SGBD e escreva o algoritmo para tratar a transação pedida no Item 1. Executando a inclusão de um pedido de duas formas:

- Transação bem sucedida;
- Transação com erro (rollback) – neste caso o pedido e as atualizações não são registradas no BD;

### 2
Quais as modificações que se propõe no modelo E-R e na lógica da transação quando se requer que o Pedido só seja confirmado como “Pedido Aceito e Pronto para entrega” após haver confirmação de pagamento via cartão de crédito ou boleto bancário. Qual seria a proposta e assim resolver toda questão de integridade e consistência da informação:

- Neste cenário, enquanto o Pedido não for pago, ele está no estado "Pedido Emitido Esperando pagamento"
- Após pagamento, pedido muda de estado para pedido aprovado

## Diagramas
<h1 align="center">
    <img alt="CCL" title="M-E-R" src="https://github.com/LucasGaravaglia/Trabalho-8BD/blob/main/expecifications/pedido_venda.png" width="700px" />
</h1>

<h1 align="center">
    <img alt="CCL" title="M-E-R" src="https://github.com/LucasGaravaglia/Trabalho-8BD/blob/main/expecifications/M_E_R.png" width="700px" />
</h1>
