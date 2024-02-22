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
-- -----------------------------------------------------
-- Schema zombies
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema zombies
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `zombies` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;
USE `zombies` ;

-- -----------------------------------------------------
-- Table `zombies`.`cod_comunidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zombies`.`cod_comunidades` (
  `com_id` INT NOT NULL,
  `comunidad` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`com_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `zombies`.`cod_provincias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zombies`.`cod_provincias` (
  `prov_id` INT NOT NULL,
  `provincia` VARCHAR(100) NOT NULL,
  `com_id` INT NOT NULL,
  PRIMARY KEY (`prov_id`, `com_id`),
  INDEX `fk_cod_provincias_cod_comunidades1_idx` (`com_id` ASC) VISIBLE,
  CONSTRAINT `fk_cod_provincias_cod_comunidades1`
    FOREIGN KEY (`com_id`)
    REFERENCES `zombies`.`cod_comunidades` (`com_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `zombies`.`cod_municipios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zombies`.`cod_municipios` (
  `mun_id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `prov_id` INT NOT NULL,
  `com_id` INT NOT NULL,
  PRIMARY KEY (`mun_id`, `prov_id`, `com_id`),
  INDEX `fk_cod_municipios_cod_provincias1_idx` (`prov_id` ASC) VISIBLE,
  INDEX `fk_cod_municipios_cod_comunidades1_idx` (`com_id` ASC) VISIBLE,
  CONSTRAINT `fk_cod_municipios_cod_provincias1`
    FOREIGN KEY (`prov_id`)
    REFERENCES `zombies`.`cod_provincias` (`prov_id`),
  CONSTRAINT `fk_cod_municipios_cod_comunidades1`
    FOREIGN KEY (`com_id`)
    REFERENCES `zombies`.`cod_comunidades` (`com_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `zombies`.`inf_com`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zombies`.`inf_com` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comunidad` VARCHAR(100) NOT NULL,
  `km2` FLOAT NOT NULL,
  `total_com` FLOAT NOT NULL,
  `densidad` FLOAT NOT NULL,
  `R0` FLOAT NOT NULL,
  `prob_inf` FLOAT NOT NULL,
  `com_id` INT NOT NULL,
  PRIMARY KEY (`id`, `com_id`),
  INDEX `fk_inf_com_cod_comunidades1_idx` (`com_id` ASC) VISIBLE,
  CONSTRAINT `fk_inf_com_cod_comunidades1`
    FOREIGN KEY (`com_id`)
    REFERENCES `zombies`.`cod_comunidades` (`com_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `zombies`.`inf_muns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zombies`.`inf_muns` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `densidad` FLOAT NOT NULL,
  `municipio` VARCHAR(100) NOT NULL,
  `R0` FLOAT NOT NULL,
  `prob_inf` FLOAT NOT NULL,
  `mun_id` INT NOT NULL,
  `prov_id` INT NOT NULL,
  PRIMARY KEY (`id`, `mun_id`, `prov_id`),
  INDEX `fk_inf_muns_cod_municipios1_idx` (`mun_id` ASC) VISIBLE,
  INDEX `fk_inf_muns_cod_provincias1_idx` (`prov_id` ASC) VISIBLE,
  CONSTRAINT `fk_inf_muns_cod_municipios1`
    FOREIGN KEY (`mun_id`)
    REFERENCES `zombies`.`cod_municipios` (`mun_id`),
  CONSTRAINT `fk_inf_muns_cod_provincias1`
    FOREIGN KEY (`prov_id`)
    REFERENCES `zombies`.`cod_provincias` (`prov_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `zombies`.`inf_prov`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zombies`.`inf_prov` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `provincia` VARCHAR(100) NOT NULL,
  `km2` FLOAT NOT NULL,
  `total_prov` FLOAT NOT NULL,
  `densidad` FLOAT NOT NULL,
  `R0` FLOAT NOT NULL,
  `prob_inf` FLOAT NOT NULL,
  `prov_id` INT NOT NULL,
  PRIMARY KEY (`id`, `prov_id`),
  INDEX `fk_inf_prov_cod_provincias_idx` (`prov_id` ASC) VISIBLE,
  CONSTRAINT `fk_inf_prov_cod_provincias`
    FOREIGN KEY (`prov_id`)
    REFERENCES `zombies`.`cod_provincias` (`prov_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
