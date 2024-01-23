CREATE DATABASE customerchurn;
CREATE TABLE `billing` (
  `BillingID` varchar(10) NOT NULL,
  `customer_ID` varchar(10) NOT NULL,
  `ContractType` varchar(20) DEFAULT NULL,
  `PaperlessBilling` varchar(10) DEFAULT NULL,
  `MonthlyCharges` float DEFAULT NULL,
  `TotalCharges` float DEFAULT NULL,
  `Churn` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`BillingID`),
  KEY `fk_Billing_Customer1_idx` (`customer_ID`),
  CONSTRAINT `fk_Billing_Customer1` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `customer` (
  `customer_ID` varchar(10) NOT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `SeniorCitizen` varchar(10) DEFAULT NULL,
  `Partner` varchar(10) DEFAULT NULL,
  `Dependents` varchar(10) DEFAULT NULL,
  `Tenure` int DEFAULT NULL,
  PRIMARY KEY (`customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `payments` (
  `PaymentID` varchar(10) NOT NULL,
  `customer_ID` varchar(10) DEFAULT NULL,
  `PaymentMethod` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `fk_Payments_Customer1_idx` (`customer_ID`),
  CONSTRAINT `fk_Payments_Customer1` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `services` (
  `ServiceID` varchar(20) NOT NULL,
  `customer_ID` varchar(20) NOT NULL,
  `InternetServices` varchar(20) DEFAULT NULL,
  `OnlineSecurity` varchar(20) DEFAULT NULL,
  `DeviceProtection` varchar(20) DEFAULT NULL,
  `TechSupport` varchar(20) DEFAULT NULL,
  `StreamingTV` varchar(20) DEFAULT NULL,
  `StreamingMovies` varchar(20) DEFAULT NULL,
  `MultipleLines` varchar(20) DEFAULT NULL,
  `OnlineBackup` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ServiceID`),
  KEY `fk_Services_Customer1_idx` (`customer_ID`),
  CONSTRAINT `fk_Services_Customer1` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
