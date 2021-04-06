-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS,
  UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS,
  FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE,
  SQL_MODE = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema Pedidos
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Pedidos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Pedidos` DEFAULT CHARACTER SET utf8;
USE `Pedidos`;
-- -----------------------------------------------------
-- Table `Pedidos`.`Bairro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pedidos`.`Bairro` (
  `idBairro` INT NOT NULL,
  `nomeBairro` VARCHAR(45) NULL,
  PRIMARY KEY (`idBairro`)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Pedidos`.`TipoLogradouro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pedidos`.`TipoLogradouro` (
  `siglaLogradouro` VARCHAR(10) NOT NULL,
  `nomeLogradouro` VARCHAR(45) NULL,
  PRIMARY KEY (`siglaLogradouro`)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Pedidos`.`Logradouro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pedidos`.`Logradouro` (
  `idLogradouro` INT NOT NULL,
  `nomeLogradouro` VARCHAR(45) NULL,
  `TipoLogradouro_siglaLogradouro` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idLogradouro`),
  INDEX `fk_Logradouro_TipoLogradouro1_idx` (`TipoLogradouro_siglaLogradouro` ASC) VISIBLE,
  CONSTRAINT `fk_Logradouro_TipoLogradouro1` FOREIGN KEY (`TipoLogradouro_siglaLogradouro`) REFERENCES `Pedidos`.`TipoLogradouro` (`siglaLogradouro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Pedidos`.`UnidadeFederaco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pedidos`.`UnidadeFederaco` (
  `siglaUf` CHAR(2) NOT NULL,
  `nomeUf` VARCHAR(45) NULL,
  PRIMARY KEY (`siglaUf`)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Pedidos`.`Cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pedidos`.`Cidade` (
  `idCidade` INT NOT NULL,
  `nomeCidade` VARCHAR(45) NULL,
  `UnidadeFederaco_siglaUf` CHAR(2) NOT NULL,
  PRIMARY KEY (`idCidade`),
  INDEX `fk_Cidade_UnidadeFederaco1_idx` (`UnidadeFederaco_siglaUf` ASC) VISIBLE,
  CONSTRAINT `fk_Cidade_UnidadeFederaco1` FOREIGN KEY (`UnidadeFederaco_siglaUf`) REFERENCES `Pedidos`.`UnidadeFederaco` (`siglaUf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Pedidos`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pedidos`.`Endereco` (
  `idEndereco` INT NOT NULL,
  `cep` VARCHAR(8) NULL,
  `Bairro_idBairro` INT NOT NULL,
  `Logradouro_idLogradouro` INT NOT NULL,
  `Cidade_idCidade` INT NOT NULL,
  PRIMARY KEY (`idEndereco`),
  INDEX `fk_Endereco_Bairro1_idx` (`Bairro_idBairro` ASC) VISIBLE,
  INDEX `fk_Endereco_Logradouro1_idx` (`Logradouro_idLogradouro` ASC) VISIBLE,
  INDEX `fk_Endereco_Cidade1_idx` (`Cidade_idCidade` ASC) VISIBLE,
  CONSTRAINT `fk_Endereco_Bairro1` FOREIGN KEY (`Bairro_idBairro`) REFERENCES `Pedidos`.`Bairro` (`idBairro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_Logradouro1` FOREIGN KEY (`Logradouro_idLogradouro`) REFERENCES `Pedidos`.`Logradouro` (`idLogradouro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_Cidade1` FOREIGN KEY (`Cidade_idCidade`) REFERENCES `Pedidos`.`Cidade` (`idCidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Pedidos`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pedidos`.`Cliente` (
  `codCliente` INT NOT NULL,
  `nomeCliente` VARCHAR(45) NULL,
  `nroCasa_endCliente` INT NULL,
  `compl_endCliente` VARCHAR(45) NULL,
  `Endereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`codCliente`, `Endereco_idEndereco`),
  INDEX `fk_Cliente_Endereco1_idx` (`Endereco_idEndereco` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Endereco1` FOREIGN KEY (`Endereco_idEndereco`) REFERENCES `Pedidos`.`Endereco` (`idEndereco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Pedidos`.`PedidoVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pedidos`.`PedidoVenda` (
  `nroPedido` INT NOT NULL AUTO_INCREMENT,
  `dtPedido` DATE NULL,
  `totoalPedido` DOUBLE NULL,
  `nroCasa_endEntrega` INT NULL,
  `compl_endEntrega` VARCHAR(45) NULL,
  `PedidoVendacol` VARCHAR(45) NULL,
  `Cliente_codCliente` INT NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`nroPedido`, `Endereco_idEndereco`),
  INDEX `fk_PedidoVenda_Cliente1_idx` (`Cliente_codCliente` ASC) VISIBLE,
  INDEX `fk_PedidoVenda_Endereco1_idx` (`Endereco_idEndereco` ASC) VISIBLE,
  CONSTRAINT `fk_PedidoVenda_Cliente1` FOREIGN KEY (`Cliente_codCliente`) REFERENCES `Pedidos`.`Cliente` (`codCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PedidoVenda_Endereco1` FOREIGN KEY (`Endereco_idEndereco`) REFERENCES `Pedidos`.`Endereco` (`idEndereco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Pedidos`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pedidos`.`Produto` (
  `codProduto` INT NOT NULL,
  `nomeProduto` VARCHAR(45) NULL,
  `precoProduto` DOUBLE NULL,
  PRIMARY KEY (`codProduto`)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Pedidos`.`ItemPedidoVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pedidos`.`ItemPedidoVenda` (
  `qtdeVenda` INT NULL,
  `precoVenda` DOUBLE NULL,
  `totalItemProduto` DOUBLE NULL,
  `PedidoVenda_nroPedido` INT NOT NULL,
  `Produto_codProduto` INT NOT NULL,
  PRIMARY KEY (`PedidoVenda_nroPedido`, `Produto_codProduto`),
  INDEX `fk_ItemPedidoVenda_Produto1_idx` (`Produto_codProduto` ASC) VISIBLE,
  CONSTRAINT `fk_ItemPedidoVenda_PedidoVenda` FOREIGN KEY (`PedidoVenda_nroPedido`) REFERENCES `Pedidos`.`PedidoVenda` (`nroPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ItemPedidoVenda_Produto1` FOREIGN KEY (`Produto_codProduto`) REFERENCES `Pedidos`.`Produto` (`codProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Pedidos`.`TipoLogradouro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pedidos`.`TipoLogradouro` (
  `siglaLogradouro` VARCHAR(10) NOT NULL,
  `nomeLogradouro` VARCHAR(45) NULL,
  PRIMARY KEY (`siglaLogradouro`)
) ENGINE = InnoDB;
SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;