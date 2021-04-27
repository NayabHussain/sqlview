-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema test
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema test
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `test` ;

-- -----------------------------------------------------
-- Table `test`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test`.`department` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `departmentName` VARCHAR(45) NULL DEFAULT NULL,
  `departmentId` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `test`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test`.`student` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `usn` VARCHAR(45) NULL DEFAULT NULL,
  `department_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Student_department_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_department`
    FOREIGN KEY (`department_id`)
    REFERENCES `test`.`department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `test`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(30) NOT NULL,
  `lastname` VARCHAR(30) NOT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `reg_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `test` ;

-- -----------------------------------------------------
-- Placeholder table for view `test`.`csdepartement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test`.`csdepartement` (`id` INT, `usn` INT, `departmentName` INT);

-- -----------------------------------------------------
-- View `test`.`csdepartement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`csdepartement`;
USE `test`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `test`.`csdepartement` AS select `s`.`id` AS `id`,`s`.`usn` AS `usn`,`d`.`departmentName` AS `departmentName` from (`test`.`student` `s` join `test`.`department` `d`) where (`d`.`id` = `s`.`department_id`);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
