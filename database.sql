-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Pedidos
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Pedidos` ;

-- -----------------------------------------------------
-- Schema Pedidos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Pedidos` DEFAULT CHARACTER SET utf8 ;
USE `Pedidos` ;

-- -----------------------------------------------------
-- Table `Pedidos`.`Bairro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pedidos`.`Bairro` ;

CREATE TABLE IF NOT EXISTS `Pedidos`.`Bairro` (
  `idBairro` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeBairro` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idBairro`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Pedidos`.`UnidadeFederacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pedidos`.`UnidadeFederacao` ;

CREATE TABLE IF NOT EXISTS `Pedidos`.`UnidadeFederacao` (
  `siglaUf` CHAR(2) NOT NULL,
  `nomeUf` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`siglaUf`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Pedidos`.`Cidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pedidos`.`Cidade` ;

CREATE TABLE IF NOT EXISTS `Pedidos`.`Cidade` (
  `idCidade` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeCidade` VARCHAR(45) NULL DEFAULT NULL,
  `UnidadeFederacao_siglaUf` CHAR(2) NOT NULL,
  PRIMARY KEY (`idCidade`),
  INDEX `fk_Cidade_UnidadeFederacao1_idx` (`UnidadeFederacao_siglaUf` ASC) VISIBLE,
  CONSTRAINT `fk_Cidade_UnidadeFederacao1`
    FOREIGN KEY (`UnidadeFederacao_siglaUf`)
    REFERENCES `Pedidos`.`UnidadeFederacao` (`siglaUf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Pedidos`.`TipoLogradouro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pedidos`.`TipoLogradouro` ;

CREATE TABLE IF NOT EXISTS `Pedidos`.`TipoLogradouro` (
  `siglaLogradouro` VARCHAR(10) NOT NULL,
  `nomeLogradouro` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`siglaLogradouro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Pedidos`.`Logradouro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pedidos`.`Logradouro` ;

CREATE TABLE IF NOT EXISTS `Pedidos`.`Logradouro` (
  `idLogradouro` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeLogradouro` VARCHAR(45) NULL DEFAULT NULL,
  `TipoLogradouro_siglaLogradouro` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idLogradouro`),
  INDEX `fk_Logradouro_TipoLogradouro1_idx` (`TipoLogradouro_siglaLogradouro` ASC) VISIBLE,
  CONSTRAINT `fk_Logradouro_TipoLogradouro1`
    FOREIGN KEY (`TipoLogradouro_siglaLogradouro`)
    REFERENCES `Pedidos`.`TipoLogradouro` (`siglaLogradouro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Pedidos`.`Endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pedidos`.`Endereco` ;

CREATE TABLE IF NOT EXISTS `Pedidos`.`Endereco` (
  `idEndereco` INT(11) NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(8) NULL DEFAULT NULL,
  `Bairro_idBairro` INT(11) NOT NULL,
  `Logradouro_idLogradouro` INT(11) NOT NULL,
  `Cidade_idCidade` INT(11) NOT NULL,
  PRIMARY KEY (`idEndereco`),
  INDEX `fk_Endereco_Bairro1_idx` (`Bairro_idBairro` ASC) VISIBLE,
  INDEX `fk_Endereco_Logradouro1_idx` (`Logradouro_idLogradouro` ASC) VISIBLE,
  INDEX `fk_Endereco_Cidade1_idx` (`Cidade_idCidade` ASC) VISIBLE,
  CONSTRAINT `fk_Endereco_Bairro1`
    FOREIGN KEY (`Bairro_idBairro`)
    REFERENCES `Pedidos`.`Bairro` (`idBairro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_Logradouro1`
    FOREIGN KEY (`Logradouro_idLogradouro`)
    REFERENCES `Pedidos`.`Logradouro` (`idLogradouro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_Cidade1`
    FOREIGN KEY (`Cidade_idCidade`)
    REFERENCES `Pedidos`.`Cidade` (`idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Pedidos`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pedidos`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `Pedidos`.`Cliente` (
  `codCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeCliente` VARCHAR(45) NULL DEFAULT NULL,
  `nroCasa_endCliente` INT(11) NULL DEFAULT NULL,
  `compl_endCliente` VARCHAR(45) NULL DEFAULT NULL,
  `Endereco_idEndereco` INT(11) NOT NULL,
  PRIMARY KEY (`codCliente`, `Endereco_idEndereco`),
  INDEX `fk_Cliente_Endereco1_idx` (`Endereco_idEndereco` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Endereco1`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `Pedidos`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Pedidos`.`PedidoVenda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pedidos`.`PedidoVenda` ;

CREATE TABLE IF NOT EXISTS `Pedidos`.`PedidoVenda` (
  `nroPedido` INT(11) NOT NULL AUTO_INCREMENT,
  `dtPedido` DATE NULL DEFAULT NULL,
  `totoalPedido` DOUBLE NULL DEFAULT NULL,
  `nroCasa_endEntrega` INT(11) NULL DEFAULT NULL,
  `compl_endEntrega` VARCHAR(45) NULL DEFAULT NULL,
  `PedidoVendacol` VARCHAR(45) NULL DEFAULT NULL,
  `Cliente_codCliente` INT(11) NOT NULL,
  `Endereco_idEndereco` INT(11) NOT NULL,
  PRIMARY KEY (`nroPedido`, `Endereco_idEndereco`),
  INDEX `fk_PedidoVenda_Cliente1_idx` (`Cliente_codCliente` ASC) VISIBLE,
  INDEX `fk_PedidoVenda_Endereco1_idx` (`Endereco_idEndereco` ASC) VISIBLE,
  CONSTRAINT `fk_PedidoVenda_Cliente1`
    FOREIGN KEY (`Cliente_codCliente`)
    REFERENCES `Pedidos`.`Cliente` (`codCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PedidoVenda_Endereco1`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `Pedidos`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Pedidos`.`Produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pedidos`.`Produto` ;

CREATE TABLE IF NOT EXISTS `Pedidos`.`Produto` (
  `codProduto` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeProduto` VARCHAR(45) NULL DEFAULT NULL,
  `precoProduto` DOUBLE NULL DEFAULT NULL,
  `qtdeEstoque` INT NULL,
  PRIMARY KEY (`codProduto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Pedidos`.`ItemPedidoVenda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pedidos`.`ItemPedidoVenda` ;

CREATE TABLE IF NOT EXISTS `Pedidos`.`ItemPedidoVenda` (
  `qtdeVenda` INT(11) NULL DEFAULT NULL,
  `precoVenda` DOUBLE NULL DEFAULT NULL,
  `totalItemProduto` DOUBLE NULL DEFAULT NULL,
  `PedidoVenda_nroPedido` INT(11) NOT NULL,
  `Produto_codProduto` INT(11) NOT NULL,
  PRIMARY KEY (`PedidoVenda_nroPedido`, `Produto_codProduto`),
  INDEX `fk_ItemPedidoVenda_Produto1_idx` (`Produto_codProduto` ASC) VISIBLE,
  CONSTRAINT `fk_ItemPedidoVenda_PedidoVenda`
    FOREIGN KEY (`PedidoVenda_nroPedido`)
    REFERENCES `Pedidos`.`PedidoVenda` (`nroPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ItemPedidoVenda_Produto1`
    FOREIGN KEY (`Produto_codProduto`)
    REFERENCES `Pedidos`.`Produto` (`codProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
