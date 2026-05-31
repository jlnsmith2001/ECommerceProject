create database e_commerce_db;
use  e_commerce_db; 
drop database e_commerce;
CREATE DATABASE IF NOT EXISTS e_commerce;
USE e_commerce;

CREATE TABLE Inventory (
    ItemID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    LastShipment DATE,
    Stock INT UNSIGNED NOT NULL
);

CREATE TABLE Manufacturer (
    ManufacturerID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ManufacturerName VARCHAR(100) NOT NULL,
    Country VARCHAR(50),
    ContactInformation VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    ProductCategory VARCHAR(50)
);

CREATE TABLE ProductDetails (
    ProductID INT UNSIGNED PRIMARY KEY,
    ProductDescription VARCHAR(255),
    Price DECIMAL(10,2) UNSIGNED NOT NULL,
    ManufacturerID INT UNSIGNED NOT NULL,
    ItemID INT UNSIGNED NOT NULL,
    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (ManufacturerID)
        REFERENCES Manufacturer(ManufacturerID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (ItemID)
        REFERENCES Inventory(ItemID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE Users (
    UserID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    UserName VARCHAR(32) UNIQUE NOT NULL,
    FullName VARCHAR(100),
    Address VARCHAR(255) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Preferences VARCHAR(100)
);


CREATE TABLE Reviews (
    ProductID INT UNSIGNED NOT NULL,
    UserID INT UNSIGNED NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 10),
    Description VARCHAR(255),
    PRIMARY KEY (ProductID, UserID),
    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (UserID)
        REFERENCES Users(UserID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Transactions (
    ProductID INT UNSIGNED NOT NULL,
    UserID INT UNSIGNED NOT NULL,
    TransactionDate DATETIME NOT NULL,
    PRIMARY KEY (ProductID, UserID, TransactionDate),
    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (UserID)
        REFERENCES Users(UserID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE Refunds (
    ProductID INT UNSIGNED NOT NULL,
    UserID INT UNSIGNED NOT NULL,
    TransactionDate DATETIME NOT NULL,
    RefundReason VARCHAR(255) NOT NULL,
    IssueDate DATE NOT NULL,
    RefundDate DATE,
    PRIMARY KEY (ProductID, UserID, TransactionDate),
    FOREIGN KEY (ProductID, UserID, TransactionDate)
        REFERENCES Transactions(ProductID, UserID, TransactionDate)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO Inventory (LastShipment, Stock) VALUES
('2024-11-10', 120),
('2024-11-12', 80),
('2024-11-15', 45),
('2024-11-18', 300),
('2024-11-20', 150),
('2024-11-22', 60),
('2024-11-25', 90),
('2024-11-26', 110),
('2024-11-28', 200),
('2024-11-30', 75),
('2024-12-01', 250),
('2024-12-02', 140),
('2024-12-03', 35),
('2024-12-04', 50),
('2024-12-05', 95),
('2024-12-06', 400),
('2024-12-07', 70),
('2024-12-08', 55),
('2024-12-09', 130),
('2024-12-10', 40);

INSERT INTO Manufacturer (ManufacturerName, Country, ContactInformation) VALUES
('TechNova', 'USA', 'contact@technova.com'),
('ElectroWorks', 'Germany', 'support@electroworks.de'),
('GigaTech', 'Japan', 'info@gigatech.jp'),
('PrimeElectronics', 'China', 'service@prime.cn'),
('NordicGear', 'Sweden', 'hello@nordicgear.se'),
('FusionDigital', 'South Korea', 'help@fusion.kr'),
('ApexDevices', 'USA', 'contact@apexdevices.com'),
('BlueWave Electronics', 'UK', 'support@bluewave.co.uk'),
('ZenithTech', 'Taiwan', 'info@zenith.tw'),
('HyperCore', 'Canada', 'support@hypercore.ca');

INSERT INTO Products (ProductName, ProductCategory) VALUES
('AeroMouse X1', 'Accessories'),
('MechaBoard Pro', 'Accessories'),
('VisionView 4K', 'Displays'),
('FlexiCable C', 'Cables'),
('LiftStand S2', 'Office'),
('SoundCube Mini', 'Audio'),
('GameWave H7', 'Audio'),
('FlashDrive Ultra', 'Storage'),
('WristFit Band', 'Wearables'),
('ClearCam HD', 'Cameras'),
('ChargePro 20W', 'Power'),
('BrightLite Desk', 'Office'),
('ComfortSeat Ergo', 'Furniture'),
('SketchPad Pro', 'Art'),
('SilentBuds X', 'Audio'),
('StreamLine HDMI', 'Cables'),
('HomeSync Hub', 'Smart Home'),
('NetBoost AX', 'Networking'),
('TravelGuard Pack', 'Bags'),
('BeamLite Mini', 'Projectors'),
('ChargeMat S', 'Power'),
('GlidePad XL', 'Accessories'),
('GlowStrip RGB', 'Smart Home'),
('KeyLite Wireless', 'Accessories'),
('CoolBreeze Pad', 'Accessories'),
('VoiceCast USB', 'Audio'),
('CaseMate Air', 'Accessories'),
('PowerGo 10K', 'Power'),
('WatchCharge S', 'Wearables'),
('QuietTone H9', 'Audio');

INSERT INTO ProductDetails (ProductID, ProductDescription, Price, ManufacturerID, ItemID) VALUES
(1, 'High precision wireless mouse', 29.99, 1, 1),
(2, 'RGB mechanical keyboard', 89.99, 2, 2),
(3, '27-inch 4K UHD Monitor', 329.99, 3, 3),
(4, 'Durable USB-C cable', 9.99, 4, 4),
(5, 'Adjustable aluminum laptop stand', 24.99, 5, 5),
(6, 'Portable Bluetooth speaker', 49.99, 6, 6),
(7, 'Surround sound gaming headset', 79.99, 7, 7),
(8, '1TB portable SSD', 119.99, 8, 8),
(9, 'Silicone smartwatch band', 14.99, 9, 9),
(10, '1080p HD webcam', 39.99, 10, 10),
(11, 'Fast charging phone adapter', 19.99, 1, 11),
(12, 'LED adjustable desk lamp', 34.99, 2, 12),
(13, 'Ergonomic office chair', 199.99, 3, 13),
(14, 'Digital graphics tablet', 149.99, 4, 14),
(15, 'Noise cancelling earbuds', 59.99, 5, 15),
(16, 'High-speed HDMI cable', 12.99, 6, 16),
(17, 'Smart home automation hub', 89.99, 7, 17),
(18, 'Dual-band WiFi router', 129.99, 8, 18),
(19, 'Waterproof laptop backpack', 49.99, 9, 19),
(20, 'Portable mini projector', 199.99, 10, 20),
(21, 'Wireless charging pad', 24.99, 1, 11),
(22, 'Gaming mouse pad XL', 19.99, 2, 1),
(23, 'Smart LED light strip', 29.99, 3, 12),
(24, 'Bluetooth keyboard', 39.99, 4, 2),
(25, 'Laptop cooling pad', 22.99, 5, 5),
(26, 'USB microphone', 59.99, 6, 10),
(27, 'Wireless earbuds case', 12.99, 7, 15),
(28, 'Portable power bank', 34.99, 8, 11),
(29, 'Smartwatch charger', 18.99, 9, 9),
(30, 'Noise reduction headset', 89.99, 10, 7);

INSERT INTO Users (UserName, FullName, Address, Email, Preferences) VALUES
('xPure01', 'Alex Johnson', '123 Maple St Seattle WA', 'alexj@example.com', 'Electronics'),
('techFan22', 'Maria Lopez', '88 Pine St Shoreline WA', 'maria.lopez@yahoo.com', 'Audio'),
('gamerMike', 'Michael Chen', '45 Oak Ave Lynnwood WA', 'mi1kec@outlook.com', 'Gaming'),
('shopper123', 'Emily Davis', '77 Cedar Rd Everett WA', 'emilyd42@gmail.com', 'Office'),
('volleyKing', 'Jason Park', '12 Birch Ln Seattle WA', 'jasonp2001@gmailcom', 'Sports'),
('animeGirl', 'Sakura Tanaka', '99 Cherry St Bellevue WA', 'tanakasakura1234@yahoo.com', 'Art'),
('dataNerd', 'Kevin Patel', '101 Lakeview Dr Redmond WA', 'kevpatel1010@gmail.com', 'Tech'),
('soundMaster', 'Liam Brown', '55 River Rd Bothell WA', 'liamsn210b@outlook.com', 'Audio'),
('smartHomeGuy', 'Noah Wilson', '66 Hilltop Rd Seattle WA', 'noah_brown_wilson4921@yahoo.com', 'Smart Home'),
('officeQueen', 'Sarah Kim', '23 Sunset Blvd Shoreline WA', 'skim10@gmail.com', 'Office'),
('zenCoder', 'Ethan Lee', '14 Forest Dr Seattle WA', 'codemaster118392@gmail.com', 'Tech'),
('volleyballPro', 'Chloe Nguyen', '88 Harbor St Edmonds WA', 'nguyenchloe1023@yahoo.com', 'Sports'),
('pixelArtist', 'Rina Sato', '33 Blossom Rd Seattle WA', 'satorina8601@outlook.com', 'Art'),
('gadgetGuru', 'Owen Carter', '44 Meadow Ln Everett WA', 'owen_c_carter85@yahoo.com', 'Electronics'),
('shopSmart', 'Ava Martinez', '77 Willow St Lynnwood WA', 'martinez_ava_m2001@gmail.com', 'Deals'),
('techieTom', 'Tom Harris', '11 Spruce St Seattle WA', 'harris12tom@gmail.com', 'Tech'),
('soundWave', 'Isabella Flores', '90 Pinecrest Dr Bothell WA', 'isabellaf@yahoo.com', 'Audio'),
('smartLife', 'Daniel Ortiz', '22 Ridge Rd Seattle WA', 'daniel_juan_ortiz93@outlook.com', 'Smart Home'),
('bagCollector', 'Mia Thompson', '55 Greenway Dr Everett WA', 'thompmia7621@gmail.com', 'Bags'),
('projectorFan', 'Lucas Wright', '101 Valley Rd Shoreline WA', 'techguy1212@gmail.com', 'Projectors');


INSERT INTO Reviews (ProductID, UserID, Rating, Description) VALUES
(1, 1, 9, 'Great mouse, very responsive'),
(2, 3, 8, 'Solid keyboard with good switches'),
(3, 5, 10, 'Amazing clarity and brightness'),
(4, 2, 7, 'Cable works fine'),
(5, 4, 9, 'Very sturdy stand'),
(6, 8, 8, 'Good sound for the price'),
(7, 3, 9, 'Comfortable and immersive'),
(8, 7, 10, 'Super fast SSD'),
(9, 6, 7, 'Band is comfortable'),
(10, 10, 8, 'Clear video quality'),
(11, 12, 9, 'Charges fast'),
(12, 14, 8, 'Bright and adjustable'),
(13, 15, 10, 'Very comfortable chair'),
(14, 16, 9, 'Great for drawing'),
(15, 17, 8, 'Good noise cancellation'),
(16, 18, 7, 'Works as expected'),
(17, 19, 9, 'Smart hub is very useful'),
(18, 20, 8, 'Strong WiFi signal'),
(19, 11, 9, 'Great backpack'),
(20, 13, 8, 'Portable and bright');


INSERT INTO Transactions (ProductID, UserID, TransactionDate) VALUES
(1, 1, '2025-01-10 14:22:00'),
(2, 3, '2025-01-11 09:15:00'),
(3, 5, '2025-01-12 16:40:00'),
(4, 2, '2025-01-13 11:05:00'),
(5, 4, '2025-01-14 13:55:00'),
(6, 8, '2025-01-15 10:30:00'),
(7, 3, '2025-01-16 17:20:00'),
(8, 7, '2025-01-17 12:10:00'),
(9, 6, '2025-01-18 15:45:00'),
(10, 10, '2025-01-19 18:25:00'),
(11, 12, '2025-01-20 09:50:00'),
(12, 14, '2025-01-21 14:35:00'),
(13, 15, '2025-01-22 16:00:00'),
(14, 16, '2025-01-23 11:45:00'),
(15, 17, '2025-01-24 13:10:00'),
(16, 18, '2025-01-25 10:05:00'),
(17, 19, '2025-01-26 17:55:00'),
(18, 20, '2025-01-27 12:30:00'),
(19, 11, '2025-01-28 15:15:00'),
(20, 13, '2025-01-29 09:40:00'),
(1, 7, '2025-02-03 09:30:00'),
(1, 12, '2025-02-15 14:20:00'),
(1, 18, '2025-04-08 11:45:00'),
(7, 5, '2025-02-10 16:10:00'),
(7, 9, '2025-03-04 13:15:00'),
(7, 14, '2025-05-22 10:25:00'),
(3, 2, '2025-02-20 15:40:00'),
(3, 11, '2025-04-12 12:30:00'),
(15, 4, '2025-03-08 09:15:00'),
(15, 8, '2025-05-18 17:45:00'),
(20, 6, '2025-03-25 14:50:00'),
(20, 10, '2025-06-01 11:05:00'),
(6, 13, '2025-04-02 16:20:00'),
(6, 19, '2025-05-05 10:10:00'),
(11, 3, '2025-04-15 13:30:00'),
(11, 16, '2025-06-10 09:40:00'),
(24, 1, '2025-05-12 18:05:00'),
(24, 17, '2025-06-14 15:20:00'),
(28, 5, '2025-05-28 11:15:00'),
(28, 20, '2025-06-20 12:45:00'),
(1, 4, '2025-02-22 10:15:00'),
(1, 9, '2025-03-10 14:20:00'),
(1, 15, '2025-05-03 18:30:00'),
(1, 20, '2025-06-18 09:10:00'),
(7, 1, '2025-02-28 11:45:00'),
(7, 11, '2025-03-18 15:00:00'),
(7, 18, '2025-04-28 13:25:00'),
(7, 20, '2025-06-08 16:40:00'),
(11, 2, '2025-02-12 09:15:00'),
(11, 7, '2025-03-22 17:20:00'),
(11, 14, '2025-05-10 10:05:00'),
(11, 19, '2025-06-25 14:15:00'),
(15, 3, '2025-02-18 13:50:00'),
(15, 9, '2025-04-01 12:15:00'),
(15, 12, '2025-05-14 18:00:00'),
(15, 20, '2025-06-22 10:20:00'),
(24, 6, '2025-03-01 11:10:00'),
(24, 8, '2025-04-09 15:45:00'),
(24, 13, '2025-05-25 09:50:00'),
(24, 19, '2025-06-27 16:30:00'),
(28, 2, '2025-02-25 14:40:00'),
(28, 10, '2025-04-18 11:35:00'),
(28, 14, '2025-05-30 17:15:00'),
(28, 18, '2025-06-29 12:25:00'),
(21, 5, '2025-03-05 10:30:00'),
(21, 11, '2025-04-22 13:40:00'),
(22, 4, '2025-03-12 15:50:00'),
(22, 17, '2025-05-08 11:20:00'),
(23, 7, '2025-03-15 16:10:00'),
(23, 16, '2025-06-05 09:40:00'),
(25, 1, '2025-04-11 10:55:00'),
(25, 12, '2025-05-21 14:30:00'),
(26, 3, '2025-04-16 18:20:00'),
(26, 15, '2025-06-03 12:05:00'),
(29, 5, '2025-05-06 11:15:00'),
(29, 13, '2025-06-12 15:50:00'),
(30, 8, '2025-05-17 13:35:00'),
(30, 18, '2025-06-15 10:10:00'),
(17, 6, '2025-04-25 17:05:00'),
(18, 9, '2025-05-27 12:45:00');
-- ============================
-- REFUNDS
-- ============================
INSERT INTO Refunds (ProductID, UserID, TransactionDate, RefundReason, IssueDate, RefundDate) VALUES
(2, 3, '2025-01-11 09:15:00', 'Item defective', '2025-02-01', '2025-02-05'),
(4, 2, '2025-01-13 11:05:00', 'Wrong item delivered', '2025-02-03', '2025-02-07'),
(6, 8, '2025-01-15 10:30:00', 'Customer changed mind', '2025-02-04', '2025-02-08'),
(8, 7, '2025-01-17 12:10:00', 'Damaged on arrival', '2025-02-06', '2025-02-10'),
(10, 10, '2025-01-19 18:25:00', 'Not as described', '2025-02-07', '2025-02-11'),
(12, 14, '2025-01-21 14:35:00', 'Late delivery', '2025-02-08', '2025-02-12'),
(14, 16, '2025-01-23 11:45:00', 'Customer dissatisfaction', '2025-02-09', '2025-02-13'),
(16, 18, '2025-01-25 10:05:00', 'Accidental purchase', '2025-02-10', '2025-02-14'),
(18, 20, '2025-01-27 12:30:00', 'Item malfunction', '2025-02-11', '2025-02-15'),
(20, 13, '2025-01-29 09:40:00', 'Better price elsewhere', '2025-02-12', '2025-02-16');

-- List which products we currently have in inventory
SELECT i.ItemID, i.Stock, p.ProductName, pd.Price
FROM inventory as i 
INNER JOIN productdetails as pd
ON i.ItemID = pd.ItemID
INNER JOIN products as p 
ON pd.ProductID = p.ProductID
WHERE i.Stock > 0;

-- Create new products
INSERT INTO Products(ProductName, ProductCategory)
VALUES("DeathAdder X", "Accessories");

-- Modify the amount of a particular product that we have in inventory 
UPDATE inventory
SET Stock = 10
WHERE ItemID = 4;

-- Delete a product from inventory

SELECT * From users