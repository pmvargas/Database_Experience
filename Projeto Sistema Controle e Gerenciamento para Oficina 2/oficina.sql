-- Paula Vargas de Medeiros.
-- Tabela cliente
CREATE TABLE Clients(
    idClients INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Lname VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(30),
    telephoneNumber CHAR(11),
    E_mail VARCHAR(128),
    CONSTRAINT unique_cpf_client UNIQUE (CPF)
);

-- Criar tabela veículos 
CREATE TABLE Vehicles(
	idVehicles INT PRIMARY KEY NOT NULL,
    Brand VARCHAR(45),
    Model VARCHAR(45),
    carYear CHAR(4),
    licensePlate VARCHAR(11) NOT NULL,
    Clients_idClients INT,
    CONSTRAINT unique_licensePlate_vehicles UNIQUE (licensePlate)
);

-- Criar tabela serviço
CREATE TABLE Service(
	IdService INT PRIMARY KEY,
    entryDate DATE,
    deliveryDate DATE,
    serviceDescription VARCHAR(45),
    Vehicles_idVehicles INT NOT NULL
);

-- Criar tabela equipe de manutenção
CREATE TABLE maintenanceStaff(
	idMaintenance INT PRIMARY KEY NOT NULL,
    mechanicalCode INT,
    Pname VARCHAR(10),
    Lname VARCHAR(20),
    Specialization VARCHAR(45),
    Service_IdService INT NOT NULL
);

-- Criar tabela OS
CREATE TABLE OS(
	idOS INT PRIMARY KEY NOT NULL,
    newParts VARCHAR(45),
    servicePerformed VARCHAR(45),
    inputData DATE,
    forecastData DATE,
    deliveryData DATE,
    Price FLOAT,
    osNumber INT,
    maintenanceStaff_idMaintenance INT NOT NULL,
    Service_IdService INT NOT NULL
);

-- Tabela mão de obra
CREATE TABLE handoOfWork(
	Budget_idBudget INT NOT NULL,
    Service VARCHAR(45),
    costPerHour CHAR(5)
);

SELECT * FROM Clients; 