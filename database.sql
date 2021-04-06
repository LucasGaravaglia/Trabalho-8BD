-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Bairro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bairro` (
  `idBairro` INT NOT NULL,
  `nomeBairro` VARCHAR(45) NULL,
  PRIMARY KEY (`idBairro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoLogradouro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoLogradouro` (
  `siglaLogradouro` VARCHAR(10) NOT NULL,
  `nomeLogradouro` VARCHAR(45) NULL,
  PRIMARY KEY (`siglaLogradouro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Logradouro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Logradouro` (
  `idLogradouro` INT NOT NULL,
  `nomeLogradouro` VARCHAR(45) NULL,
  `TipoLogradouro_siglaLogradouro` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idLogradouro`),
  INDEX `fk_Logradouro_TipoLogradouro1_idx` (`TipoLogradouro_siglaLogradouro` ASC) VISIBLE,
  CONSTRAINT `fk_Logradouro_TipoLogradouro1`
    FOREIGN KEY (`TipoLogradouro_siglaLogradouro`)
    REFERENCES `mydb`.`TipoLogradouro` (`siglaLogradouro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UnidadeFederaco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`UnidadeFederaco` (
  `siglaUf` CHAR(2) NOT NULL,
  `nomeUf` VARCHAR(45) NULL,
  PRIMARY KEY (`siglaUf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cidade` (
  `idCidade` INT NOT NULL,
  `nomeCidade` VARCHAR(45) NULL,
  `UnidadeFederaco_siglaUf` CHAR(2) NOT NULL,
  PRIMARY KEY (`idCidade`),
  INDEX `fk_Cidade_UnidadeFederaco1_idx` (`UnidadeFederaco_siglaUf` ASC) VISIBLE,
  CONSTRAINT `fk_Cidade_UnidadeFederaco1`
    FOREIGN KEY (`UnidadeFederaco_siglaUf`)
    REFERENCES `mydb`.`UnidadeFederaco` (`siglaUf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco` (
  `idEndereco` INT NOT NULL,
  `cep` VARCHAR(8) NULL,
  `Bairro_idBairro` INT NOT NULL,
  `Logradouro_idLogradouro` INT NOT NULL,
  `Cidade_idCidade` INT NOT NULL,
  PRIMARY KEY (`idEndereco`),
  INDEX `fk_Endereco_Bairro1_idx` (`Bairro_idBairro` ASC) VISIBLE,
  INDEX `fk_Endereco_Logradouro1_idx` (`Logradouro_idLogradouro` ASC) VISIBLE,
  INDEX `fk_Endereco_Cidade1_idx` (`Cidade_idCidade` ASC) VISIBLE,
  CONSTRAINT `fk_Endereco_Bairro1`
    FOREIGN KEY (`Bairro_idBairro`)
    REFERENCES `mydb`.`Bairro` (`idBairro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_Logradouro1`
    FOREIGN KEY (`Logradouro_idLogradouro`)
    REFERENCES `mydb`.`Logradouro` (`idLogradouro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_Cidade1`
    FOREIGN KEY (`Cidade_idCidade`)
    REFERENCES `mydb`.`Cidade` (`idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `codCliente` INT NOT NULL,
  `nomeCliente` VARCHAR(45) NULL,
  `nroCasa_endCliente` INT NULL,
  `compl_endCliente` VARCHAR(45) NULL,
  `Endereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`codCliente`, `Endereco_idEndereco`),
  INDEX `fk_Cliente_Endereco1_idx` (`Endereco_idEndereco` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Endereco1`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `mydb`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PedidoVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PedidoVenda` (
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
  CONSTRAINT `fk_PedidoVenda_Cliente1`
    FOREIGN KEY (`Cliente_codCliente`)
    REFERENCES `mydb`.`Cliente` (`codCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PedidoVenda_Endereco1`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `mydb`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `codProduto` INT NOT NULL,
  `nomeProduto` VARCHAR(45) NULL,
  `precoProduto` DOUBLE NULL,
  PRIMARY KEY (`codProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ItemPedidoVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ItemPedidoVenda` (
  `qtdeVenda` INT NULL,
  `precoVenda` DOUBLE NULL,
  `totalItemProduto` DOUBLE NULL,
  `PedidoVenda_nroPedido` INT NOT NULL,
  `Produto_codProduto` INT NOT NULL,
  PRIMARY KEY (`PedidoVenda_nroPedido`, `Produto_codProduto`),
  INDEX `fk_ItemPedidoVenda_Produto1_idx` (`Produto_codProduto` ASC) VISIBLE,
  CONSTRAINT `fk_ItemPedidoVenda_PedidoVenda`
    FOREIGN KEY (`PedidoVenda_nroPedido`)
    REFERENCES `mydb`.`PedidoVenda` (`nroPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ItemPedidoVenda_Produto1`
    FOREIGN KEY (`Produto_codProduto`)
    REFERENCES `mydb`.`Produto` (`codProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoLogradouro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoLogradouro` (
  `siglaLogradouro` VARCHAR(10) NOT NULL,
  `nomeLogradouro` VARCHAR(45) NULL,
  PRIMARY KEY (`siglaLogradouro`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
