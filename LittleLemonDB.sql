-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Phone` INT NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Orders_customers_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Price` DECIMAL NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Cuisine` VARCHAR(255) NOT NULL,
  `StarterID` INT NOT NULL,
  `CourseID` INT NOT NULL,
  `DessertID` INT NOT NULL,
  `DrinkID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Menu_starter_idx` (`StarterID` ASC) VISIBLE,
  INDEX `fk_Menu_course_idx` (`CourseID` ASC) VISIBLE,
  INDEX `fk_Menu_dessert_idx` (`DessertID` ASC) VISIBLE,
  INDEX `fk_Menu_drink_idx` (`DrinkID` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_starter`
    FOREIGN KEY (`StarterID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Menu_course`
    FOREIGN KEY (`CourseID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Menu_dessert`
    FOREIGN KEY (`DessertID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Menu_drink`
    FOREIGN KEY (`DrinkID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `ID` INT NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `AnnualSalary` DECIMAL NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `DateTime` DATETIME NOT NULL,
  `TableNo` INT NOT NULL,
  `DurationHours` DECIMAL NOT NULL,
  `CustomerID` INT NOT NULL,
  `ResponsibleStaff` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Bookings_customers_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_Bookings_staff_idx` (`ResponsibleStaff` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Bookings_staff`
    FOREIGN KEY (`ResponsibleStaff`)
    REFERENCES `LittleLemonDB`.`Staff` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Deliveries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Deliveries` (
  `ID` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Status` VARCHAR(255) NOT NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Deliveries_orders_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_Deliveries_orders`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB`.`Orders` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItemsOrders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItemsOrders` (
  `MenuItemID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`MenuItemID`, `OrderID`),
  INDEX `fk_MenuItemsOrders_orders_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_MenuItemsOrders_orders`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB`.`Orders` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_MenuItemsOrders_menuItems`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
