-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hospital_management
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hospital_management
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hospital_management` DEFAULT CHARACTER SET utf8 ;
USE `hospital_management` ;

-- -----------------------------------------------------
-- Table `hospital_management`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_management`.`Users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(70) NOT NULL,
  `phone_num` VARCHAR(20) NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phone_num_UNIQUE` (`phone_num` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_management`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_management`.`Roles` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `permission` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_management`.`UserRoles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_management`.`UserRoles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_UserRoles_Roles1_idx` (`role_id` ASC) VISIBLE,
  INDEX `fk_UserRoles_Users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_UserRoles_Roles1`
    FOREIGN KEY (`role_id`)
    REFERENCES `hospital_management`.`Roles` (`role_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_UserRoles_Users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `hospital_management`.`Users` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
