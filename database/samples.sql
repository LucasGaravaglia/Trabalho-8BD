USE Pedidos;

INSERT INTO Bairro (nomeBairro) VALUES ("Coroado");
INSERT INTO Bairro (nomeBairro) VALUES ("Indianópolis");
INSERT INTO Bairro (nomeBairro) VALUES ("Igapó");
INSERT INTO Bairro (nomeBairro) VALUES ("Setor 03");
INSERT INTO Bairro (nomeBairro) VALUES ("Rio Doce");
INSERT INTO Bairro (nomeBairro) VALUES ("Condominio Residencial Camping Club");
INSERT INTO Bairro (nomeBairro) VALUES ("Jardim Jorge Teixeira");
INSERT INTO Bairro (nomeBairro) VALUES ("Sao Francisco");
INSERT INTO Bairro (nomeBairro) VALUES ("Clima Bom");
INSERT INTO Bairro (nomeBairro) VALUES ("Andra Gadelha");
INSERT INTO Bairro (nomeBairro) VALUES ("Marinho");
INSERT INTO Bairro (nomeBairro) VALUES ("Vila Nasser");
INSERT INTO Bairro (nomeBairro) VALUES ("Residencial Paraiso");

INSERT INTO UnidadeFederacao (siglaUf, nomeUf) VALUES ("ES", "Espiritu Santo");
INSERT INTO UnidadeFederacao (siglaUf, nomeUf) VALUES ("SP", "Sao Paulo");
INSERT INTO UnidadeFederacao (siglaUf, nomeUf) VALUES ("RN", "Rio Grande do Norte");
INSERT INTO UnidadeFederacao (siglaUf, nomeUf) VALUES ("RO", "Roraima");
INSERT INTO UnidadeFederacao (siglaUf, nomeUf) VALUES ("PE", "Pernambuco");
INSERT INTO UnidadeFederacao (siglaUf, nomeUf) VALUES ("MT", "Mato Grosso do Sul");
INSERT INTO UnidadeFederacao (siglaUf, nomeUf) VALUES ("AC", "Acre");
INSERT INTO UnidadeFederacao (siglaUf, nomeUf) VALUES ("PB", "Paraiba");
INSERT INTO UnidadeFederacao (siglaUf, nomeUf) VALUES ("AL", "Alagoas");
INSERT INTO UnidadeFederacao (siglaUf, nomeUf) VALUES ("MA", "Maranhao");

INSERT INTO Cidade (nomeCidade, UnidadeFederacao_siglaUf) VALUES ("Guarapari","ES");
INSERT INTO Cidade (nomeCidade, UnidadeFederacao_siglaUf) VALUES ("São Paulo", "SP");
INSERT INTO Cidade (nomeCidade, UnidadeFederacao_siglaUf) VALUES ("Natal", "RN");
INSERT INTO Cidade (nomeCidade, UnidadeFederacao_siglaUf) VALUES ("Ariquemes", "RO");
INSERT INTO Cidade (nomeCidade, UnidadeFederacao_siglaUf) VALUES ("Olinda", "PE");
INSERT INTO Cidade (nomeCidade, UnidadeFederacao_siglaUf) VALUES ("Sinop", "MT");
INSERT INTO Cidade (nomeCidade, UnidadeFederacao_siglaUf) VALUES ("Ariquemes", "PB");
INSERT INTO Cidade (nomeCidade, UnidadeFederacao_siglaUf) VALUES ("Rio Branco", "AC");
INSERT INTO Cidade (nomeCidade, UnidadeFederacao_siglaUf) VALUES ("Maceió", "AL");
INSERT INTO Cidade (nomeCidade, UnidadeFederacao_siglaUf) VALUES ("Sousa", "MA");
INSERT INTO Cidade (nomeCidade, UnidadeFederacao_siglaUf) VALUES ("Campo Grande", "MT");
INSERT INTO Cidade (nomeCidade, UnidadeFederacao_siglaUf) VALUES ("São Luís", "MA");

INSERT INTO TipoLogradouro (siglaLogradouro, nomeLogradouro) VALUES ("R.", "Rua");
INSERT INTO TipoLogradouro (siglaLogradouro, nomeLogradouro) VALUES ("Av.", "Avenida");
INSERT INTO TipoLogradouro (siglaLogradouro, nomeLogradouro) VALUES ("Al.", "Alameda");

INSERT INTO Logradouro (nomeLogradouro, TipoLogradouro_siglaLogradouro) VALUES ("Atílio Vivacqua", "R.");
INSERT INTO Logradouro (nomeLogradouro, TipoLogradouro_siglaLogradouro) VALUES ("Indianópolis", "Av.");
INSERT INTO Logradouro (nomeLogradouro, TipoLogradouro_siglaLogradouro) VALUES ("Irmã Vitória", "R.");
INSERT INTO Logradouro (nomeLogradouro, TipoLogradouro_siglaLogradouro) VALUES ("São Paulo", "Al.");
INSERT INTO Logradouro (nomeLogradouro, TipoLogradouro_siglaLogradouro) VALUES ("Setenta", "R.");
INSERT INTO Logradouro (nomeLogradouro, TipoLogradouro_siglaLogradouro) VALUES ("da Matrinchã", "Av.");
INSERT INTO Logradouro (nomeLogradouro, TipoLogradouro_siglaLogradouro) VALUES ("Açaí", "R.");
INSERT INTO Logradouro (nomeLogradouro, TipoLogradouro_siglaLogradouro) VALUES ("A2", "R.");
INSERT INTO Logradouro (nomeLogradouro, TipoLogradouro_siglaLogradouro) VALUES ("Monsenhor Vicente de Freitas", "R.");
INSERT INTO Logradouro (nomeLogradouro, TipoLogradouro_siglaLogradouro) VALUES ("Marluce", "R.");
INSERT INTO Logradouro (nomeLogradouro, TipoLogradouro_siglaLogradouro) VALUES ("Babaçu", "R.");


INSERT INTO Endereco (CEP, Cidade_idCidade, Logradouro_idLogradouro, Bairro_idBairro) VALUES ("29203500", 1, 5, 12 );
INSERT INTO Endereco (CEP, Cidade_idCidade, Logradouro_idLogradouro, Bairro_idBairro) VALUES ("04062002", 2, 4, 11);
INSERT INTO Endereco (CEP, Cidade_idCidade, Logradouro_idLogradouro, Bairro_idBairro) VALUES ("59106029", 3, 3, 10);
INSERT INTO Endereco (CEP, Cidade_idCidade, Logradouro_idLogradouro, Bairro_idBairro) VALUES ("76870340", 4, 2, 9);
INSERT INTO Endereco (CEP, Cidade_idCidade, Logradouro_idLogradouro, Bairro_idBairro) VALUES ("53090500", 5, 1, 8);
INSERT INTO Endereco (CEP, Cidade_idCidade, Logradouro_idLogradouro, Bairro_idBairro) VALUES ("78551233", 6, 6, 7);
INSERT INTO Endereco (CEP, Cidade_idCidade, Logradouro_idLogradouro, Bairro_idBairro) VALUES ("76876520", 7, 7, 6);
INSERT INTO Endereco (CEP, Cidade_idCidade, Logradouro_idLogradouro, Bairro_idBairro) VALUES ("69901525", 8, 8, 5);
INSERT INTO Endereco (CEP, Cidade_idCidade, Logradouro_idLogradouro, Bairro_idBairro) VALUES ("57071560", 9, 9, 4);
INSERT INTO Endereco (CEP, Cidade_idCidade, Logradouro_idLogradouro, Bairro_idBairro) VALUES ("58806380", 10, 10,3 );
INSERT INTO Endereco (CEP, Cidade_idCidade, Logradouro_idLogradouro, Bairro_idBairro) VALUES ("79117542", 11, 11, 2);
INSERT INTO Endereco (CEP, Cidade_idCidade, Logradouro_idLogradouro, Bairro_idBairro) VALUES ("65081788", 12, 3, 1);


INSERT INTO Cliente (nomeCliente, Endereco_idEndereco, nroCasa_endCliente) VALUES ("Pedro Kevin Isaac Silveira", 12,"582");
INSERT INTO Cliente (nomeCliente, Endereco_idEndereco, nroCasa_endCliente) VALUES ("Davi Marcelo da Costa",11 ,"321");
INSERT INTO Cliente (nomeCliente, Endereco_idEndereco, nroCasa_endCliente) VALUES ("Nicolas Ryan Edson da Rosa", 10,"140");
INSERT INTO Cliente (nomeCliente, Endereco_idEndereco, nroCasa_endCliente) VALUES ("Milena Aparecida Nicole Oliveira",9 ,"730");
INSERT INTO Cliente (nomeCliente, Endereco_idEndereco, nroCasa_endCliente) VALUES ("Larissa Adriana Marcela da Costa", 8,"458");
INSERT INTO Cliente (nomeCliente, Endereco_idEndereco, nroCasa_endCliente) VALUES ("Catarina Luana Almeida", 7,"269");
INSERT INTO Cliente (nomeCliente, Endereco_idEndereco, nroCasa_endCliente) VALUES ("Vitor Benício Paulo Galvão", 6,"903");
INSERT INTO Cliente (nomeCliente, Endereco_idEndereco, nroCasa_endCliente) VALUES ("Augusto Ricardo Antonio da Rocha",5 ,"921");
INSERT INTO Cliente (nomeCliente, Endereco_idEndereco, nroCasa_endCliente) VALUES ("Andreia Eliane Julia Rocha",4 ,"696");
INSERT INTO Cliente (nomeCliente, Endereco_idEndereco, nroCasa_endCliente) VALUES ("Raul Otávio Benedito Duarte", 3,"882");
INSERT INTO Cliente (nomeCliente, Endereco_idEndereco, nroCasa_endCliente) VALUES ("Alessandra Catarina Cláudia Teixeira", 2,"488");
INSERT INTO Cliente (nomeCliente, Endereco_idEndereco, nroCasa_endCliente) VALUES ("Severino Raul Leonardo Farias",1 ,"966");

INSERT INTO `Produto` (`nomeProduto`,`precoProduto`,`qtedEstoque`) VALUES  ("cereals",53,13), ("noodles",165,35), ("salads",155,11), ("pies",144,24), ("desserts",11,13), ("seafood",147,31), ("soups",9,49); ("pasta",29,18), ("sandwiches",1,42);
