-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cerebralcortex
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cerebralcortex
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cerebralcortex` DEFAULT CHARACTER SET utf8 ;
USE `cerebralcortex` ;

-- -----------------------------------------------------
-- Table `cerebralcortex`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cerebralcortex`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `metadata` JSON NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cerebralcortex`.`processing_module`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cerebralcortex`.`processing_module` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `metadata` JSON NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cerebralcortex`.`datastream`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cerebralcortex`.`datastream` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `processing_module_id` INT NOT NULL,
  `metadata` JSON NOT NULL,
  INDEX `fk_users_id` (`user_id` ASC),
  INDEX `fk_processing_module` (`processing_module_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `cerebralcortex`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_processing_module`
    FOREIGN KEY (`processing_module_id`)
    REFERENCES `cerebralcortex`.`processing_module` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cerebralcortex`.`spanstream`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cerebralcortex`.`spanstream` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `source_ids` JSON NOT NULL,
  `processing_module_id` INT NOT NULL,
  `metadata` JSON NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_spanstream_processing_module1_idx` (`processing_module_id` ASC),
  CONSTRAINT `fk_spanstream_processing_module1`
    FOREIGN KEY (`processing_module_id`)
    REFERENCES `cerebralcortex`.`processing_module` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

