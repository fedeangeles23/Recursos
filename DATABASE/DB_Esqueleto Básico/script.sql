-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db_prueba
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_prueba
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_prueba` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `db_prueba` ;

-- -----------------------------------------------------
-- Table `db_prueba`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_prueba`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `edad` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_prueba`.`img_perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_prueba`.`img_perfil` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NOT NULL,
  `Usuarios_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Img Perfil_Usuarios_idx` (`Usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_Img Perfil_Usuarios`
    FOREIGN KEY (`Usuarios_id`)
    REFERENCES `db_prueba`.`usuarios` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_prueba`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_prueba`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_prueba`.`marcas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_prueba`.`marcas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idmarcas_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_prueba`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_prueba`.`productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  `descuento` VARCHAR(45) NOT NULL,
  `stock` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `imagen` VARCHAR(200) NOT NULL,
  `categorias_id` INT NOT NULL,
  `marcas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idproductos_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_productos_categorias1_idx` (`categorias_id` ASC) VISIBLE,
  INDEX `fk_productos_marcas1_idx` (`marcas_id` ASC) VISIBLE,
  CONSTRAINT `fk_productos_categorias1`
    FOREIGN KEY (`categorias_id`)
    REFERENCES `db_prueba`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_marcas1`
    FOREIGN KEY (`marcas_id`)
    REFERENCES `db_prueba`.`marcas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_prueba`.`subcategorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_prueba`.`subcategorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `categorias_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idsubcategorias_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_subcategorias_categorias1_idx` (`categorias_id` ASC) VISIBLE,
  CONSTRAINT `fk_subcategorias_categorias1`
    FOREIGN KEY (`categorias_id`)
    REFERENCES `db_prueba`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_prueba`.`Favoritos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_prueba`.`Favoritos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuarios_id` INT NOT NULL,
  `productos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Favoritos_usuarios1_idx` (`usuarios_id` ASC) VISIBLE,
  INDEX `fk_Favoritos_productos1_idx` (`productos_id` ASC) VISIBLE,
  CONSTRAINT `fk_Favoritos_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `db_prueba`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Favoritos_productos1`
    FOREIGN KEY (`productos_id`)
    REFERENCES `db_prueba`.`productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_prueba`.`img_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_prueba`.`img_productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NULL,
  `productos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idimg_productos_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_img_productos_productos1_idx` (`productos_id` ASC) VISIBLE,
  CONSTRAINT `fk_img_productos_productos1`
    FOREIGN KEY (`productos_id`)
    REFERENCES `db_prueba`.`productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
