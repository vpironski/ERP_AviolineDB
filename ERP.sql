-- MySQL Script generated by MySQL Workbench
-- Tue May  7 11:28:02 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema erp_avioline
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema erp_avioline
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `erp_avioline` DEFAULT CHARACTER SET utf8 ;
USE `erp_avioline` ;

-- -----------------------------------------------------
-- Table `erp_avioline`.`classification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_avioline`.`classification` (
  `idclassification` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idclassification`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `erp_avioline`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_avioline`.`employees` (
  `idemployees` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(120) NOT NULL,
  `adress` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `gender` ENUM("Male", "Female") NOT NULL,
  `info` TEXT(300) NOT NULL,
  `classification_idclassification` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idemployees`),
  INDEX `fk_employees_classification_idx` (`classification_idclassification` ASC),
  CONSTRAINT `fk_employees_classification`
    FOREIGN KEY (`classification_idclassification`)
    REFERENCES `erp_avioline`.`classification` (`idclassification`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `erp_avioline`.`crew`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_avioline`.`crew` (
  `idcrew` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idcrew`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `erp_avioline`.`crew_has_employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_avioline`.`crew_has_employees` (
  `crew_idcrew` INT UNSIGNED NOT NULL,
  `employees_idemployees` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`crew_idcrew`),
  INDEX `fk_crew_has_employees_employees1_idx` (`employees_idemployees` ASC),
  INDEX `fk_crew_has_employees_crew1_idx` (`crew_idcrew` ASC),
  CONSTRAINT `fk_crew_has_employees_crew1`
    FOREIGN KEY (`crew_idcrew`)
    REFERENCES `erp_avioline`.`crew` (`idcrew`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_crew_has_employees_employees1`
    FOREIGN KEY (`employees_idemployees`)
    REFERENCES `erp_avioline`.`employees` (`idemployees`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `erp_avioline`.`engines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_avioline`.`engines` (
  `idengines` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `manufacturer` VARCHAR(45) NOT NULL,
  `cycleOfRepairs` VARCHAR(45) NOT NULL,
  `fuelConsumtion` VARCHAR(45) NOT NULL,
  `distanceTraveled` INT NOT NULL,
  PRIMARY KEY (`idengines`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `erp_avioline`.`planes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_avioline`.`planes` (
  `idplanes` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `manufacturer` VARCHAR(45) NOT NULL,
  `cruiseSpeed` INT NOT NULL,
  `maxSpeed` INT NOT NULL,
  `fuelConsumtionCruise` DOUBLE NOT NULL,
  `fuelConsumtionMax` DOUBLE NOT NULL,
  `fuelCapacity` INT NOT NULL,
  `maxWeight` DOUBLE NOT NULL,
  `weight` DOUBLE NOT NULL,
  `cycleOfRepairs` VARCHAR(45) NOT NULL,
  `passengersInClasses` TEXT(200) NOT NULL,
  `based` VARCHAR(45) NOT NULL,
  `flownWith` INT NOT NULL,
  `landingPath` DOUBLE NOT NULL,
  `engines_idengines` INT UNSIGNED NOT NULL,
  `maxDistande` INT NOT NULL,
  PRIMARY KEY (`idplanes`),
  INDEX `fk_planes_engines1_idx` (`engines_idengines` ASC),
  CONSTRAINT `fk_planes_engines1`
    FOREIGN KEY (`engines_idengines`)
    REFERENCES `erp_avioline`.`engines` (`idengines`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `erp_avioline`.`planes_has_crew`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_avioline`.`planes_has_crew` (
  `planes_idplanes` INT UNSIGNED NOT NULL,
  `crew_idcrew` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`crew_idcrew`, `planes_idplanes`),
  INDEX `fk_planes_has_crew_crew1_idx` (`crew_idcrew` ASC),
  INDEX `fk_planes_has_crew_planes1_idx` (`planes_idplanes` ASC),
  CONSTRAINT `fk_planes_has_crew_planes1`
    FOREIGN KEY (`planes_idplanes`)
    REFERENCES `erp_avioline`.`planes` (`idplanes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_planes_has_crew_crew1`
    FOREIGN KEY (`crew_idcrew`)
    REFERENCES `erp_avioline`.`crew` (`idcrew`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `erp_avioline`.`classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_avioline`.`classes` (
  `idclasses` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idclasses`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `erp_avioline`.`planes_has_classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_avioline`.`planes_has_classes` (
  `planes_idplanes` INT UNSIGNED NOT NULL,
  `classes_idclasses` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`planes_idplanes`, `classes_idclasses`),
  INDEX `fk_planes_has_classes_classes1_idx` (`classes_idclasses` ASC),
  INDEX `fk_planes_has_classes_planes1_idx` (`planes_idplanes` ASC),
  CONSTRAINT `fk_planes_has_classes_planes1`
    FOREIGN KEY (`planes_idplanes`)
    REFERENCES `erp_avioline`.`planes` (`idplanes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_planes_has_classes_classes1`
    FOREIGN KEY (`classes_idclasses`)
    REFERENCES `erp_avioline`.`classes` (`idclasses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `erp_avioline`.`routes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_avioline`.`routes` (
  `idroutes` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `startPoint` VARCHAR(45) NOT NULL,
  `finishPoint` VARCHAR(45) NOT NULL,
  `starHour` DATETIME NOT NULL,
  `finishHour` VARCHAR(45) NOT NULL,
  `lenght` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idroutes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `erp_avioline`.`Flights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_avioline`.`Flights` (
  `idFlights` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `routes_idroutes` INT UNSIGNED NOT NULL,
  `planes_idplanes` INT UNSIGNED NOT NULL,
  `crew_idcrew` INT UNSIGNED NOT NULL,
  `passangers` INT NOT NULL,
  `weight` DOUBLE NOT NULL,
  PRIMARY KEY (`idFlights`),
  INDEX `fk_Flights_routes1_idx` (`routes_idroutes` ASC),
  INDEX `fk_Flights_planes1_idx` (`planes_idplanes` ASC),
  INDEX `fk_Flights_crew1_idx` (`crew_idcrew` ASC),
  CONSTRAINT `fk_Flights_routes1`
    FOREIGN KEY (`routes_idroutes`)
    REFERENCES `erp_avioline`.`routes` (`idroutes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flights_planes1`
    FOREIGN KEY (`planes_idplanes`)
    REFERENCES `erp_avioline`.`planes` (`idplanes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flights_crew1`
    FOREIGN KEY (`crew_idcrew`)
    REFERENCES `erp_avioline`.`crew` (`idcrew`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `erp_avioline`.`airports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_avioline`.`airports` (
  `idairports` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `info` TEXT(200) NOT NULL,
  `code` INT NOT NULL,
  `runwayLenght` DOUBLE NOT NULL,
  PRIMARY KEY (`idairports`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `erp_avioline`.`airports_has_Flights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_avioline`.`airports_has_Flights` (
  `airports_idairports` INT UNSIGNED NOT NULL,
  `Flights_idFlights` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`airports_idairports`, `Flights_idFlights`),
  INDEX `fk_airports_has_Flights_Flights1_idx` (`Flights_idFlights` ASC),
  INDEX `fk_airports_has_Flights_airports1_idx` (`airports_idairports` ASC),
  CONSTRAINT `fk_airports_has_Flights_airports1`
    FOREIGN KEY (`airports_idairports`)
    REFERENCES `erp_avioline`.`airports` (`idairports`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_airports_has_Flights_Flights1`
    FOREIGN KEY (`Flights_idFlights`)
    REFERENCES `erp_avioline`.`Flights` (`idFlights`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
