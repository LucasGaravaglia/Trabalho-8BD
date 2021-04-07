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

INSERT INTO `Produto` (`nomeProduto`,`precoProduto`) VALUES ("stews",49),("desserts",450),("sandwiches",911),("stews",370),("noodles",394),("cereals",601),("pasta",419),("soups",589),("noodles",872),("cereals",134);
INSERT INTO `Produto` (`nomeProduto`,`precoProduto`) VALUES ("seafood",989),("cereals",441),("stews",173),("desserts",116),("noodles",682),("stews",862),("desserts",857),("stews",282),("desserts",186),("cereals",245);
INSERT INTO `Produto` (`nomeProduto`,`precoProduto`) VALUES ("noodles",560),("seafood",886),("sandwiches",121),("desserts",29),("cereals",733),("stews",375),("pasta",337),("pies",893),("cereals",458),("seafood",19);
INSERT INTO `Produto` (`nomeProduto`,`precoProduto`) VALUES ("desserts",870),("pies",496),("pasta",657),("pies",378),("seafood",741),("cereals",817),("desserts",795),("stews",747),("stews",117),("noodles",832);
INSERT INTO `Produto` (`nomeProduto`,`precoProduto`) VALUES ("noodles",919),("soups",306),("cereals",63),("seafood",415),("noodles",33),("stews",182),("noodles",800),("sandwiches",455),("seafood",818),("salads",721);
INSERT INTO `Produto` (`nomeProduto`,`precoProduto`) VALUES ("desserts",276),("sandwiches",931),("noodles",478),("salads",503),("desserts",150),("seafood",406),("pies",90),("seafood",455),("cereals",66),("desserts",621);
INSERT INTO `Produto` (`nomeProduto`,`precoProduto`) VALUES ("soups",100),("pasta",727),("desserts",599),("stews",597),("pies",737),("salads",430),("sandwiches",982),("pasta",731),("stews",336),("soups",90);
INSERT INTO `Produto` (`nomeProduto`,`precoProduto`) VALUES ("soups",564),("pies",82),("salads",175),("noodles",829),("cereals",326),("desserts",269),("stews",995),("seafood",696),("pies",283),("cereals",917);
INSERT INTO `Produto` (`nomeProduto`,`precoProduto`) VALUES ("soups",783),("desserts",475),("pies",955),("stews",426),("desserts",499),("soups",30),("pies",699),("pies",637),("pasta",312),("salads",159);
INSERT INTO `Produto` (`nomeProduto`,`precoProduto`) VALUES ("sandwiches",93),("pasta",909),("stews",701),("stews",943),("stews",3),("seafood",66),("pasta",924),("cereals",168),("seafood",674),("desserts",15);
