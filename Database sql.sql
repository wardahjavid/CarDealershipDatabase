-- 1 /*Create Database*/
CREATE DATABASE CarDealershipDatabase;
USE CarDealershipDatabase;

-- 2 /*Table 1: Dealership, like northwind suppliers or shippers tables*/
CREATE TABLE dealerships (
    dealershipId INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(12),
    PRIMARY KEY (dealershipId)
);

-- 3 /*Table 2: vehicles, like products table*/
CREATE TABLE vehicles (
    VIN VARCHAR(17) NOT NULL,
    make VARCHAR(50),
    model VARCHAR(50),
    year INT,
    SOLD BOOLEAN,
    color VARCHAR(50),
    vehicleType VARCHAR(50),
    odometer INT,
    price DOUBLE,
    PRIMARY KEY (VIN)
);

-- 4 /*Table 3: inventory (dealership - vehicle relationship)*/
CREATE TABLE inventory (
    dealershipId INT NOT NULL,
    VIN VARCHAR(17) NOT NULL,
	PRIMARY KEY (dealershipId, VIN),
	FOREIGN KEY (dealershipId) REFERENCES dealerships(dealershipId),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- 5 /*Table 4: sales contracts*/
CREATE TABLE salesContracts (
    contractId INT NOT NULL AUTO_INCREMENT,
    VIN VARCHAR(17),
    saleDate DATE,
    price DECIMAL(10,2),
    PRIMARY KEY (contractId),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- 6 /*Table 5: lease contracts*/
CREATE TABLE leaseContracts (
    contractId INT NOT NULL AUTO_INCREMENT,
    VIN VARCHAR(17),
    leaseStart DATE,
    leaseEnd DATE,
    monthlyPayment DECIMAL(10,2),
    PRIMARY KEY (contractId),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- 7 /*Sample data for dealerships*/
INSERT INTO dealerships (name, address, phone)
VALUES 
('Auto Galaxy', '123 Main St', '555-111-2222'),
('Speedway Motors', '88 Sunset Blvd', '555-222-3333'),
('Elite Auto House', '450 Market Rd', '555-333-4444');

/*sample data for vehicles*/
INSERT INTO vehicles (VIN, make, model, year, SOLD, color, vehicleType, odometer, price)
VALUES
('1HGCM82633A004352', 'Honda', 'Accord', 2020, FALSE, 'Blue', 'Sedan', 15000, 22500.00),
('2C4RC1BG9JR123456', 'Chrysler', 'Pacifica', 2019, FALSE, 'Black', 'Van', 23000, 28900.00),
('3FAFP31N44R123789', 'Ford', 'Focus', 2018, TRUE, 'Red', 'Hatchback', 41000, 10900.00),
('5YJ3E1EA7JF012345', 'Tesla', 'Model 3', 2021, FALSE, 'White', 'Electric', 9000, 37900.00),
('1FTFW1E50MFB67890', 'Ford', 'F-150', 2022, FALSE, 'Gray', 'Truck', 5000, 48900.00);

/*sample data for inventory*/
INSERT INTO inventory (dealershipId, VIN)
VALUES
(1, '1HGCM82633A004352'),
(1, '2C4RC1BG9JR123456'),
(2, '3FAFP31N44R123789'),
(2, '5YJ3E1EA7JF012345'),
(3, '1FTFW1E50MFB67890');

/*sample data for sales contracts*/
INSERT INTO salesContracts (VIN, saleDate, price)
VALUES
('3FAFP31N44R123789', '2024-04-05', 10500.00);

/*sample data for lease contracts*/
INSERT INTO leaseContracts (VIN, leaseStart, leaseEnd, monthlyPayment)
VALUES
('5YJ3E1EA7JF012345', '2024-01-01', '2027-01-01', 599.00);
