DROP TABLE IF EXISTS albergues;


CREATE TABLE albergues (
    identificador        INT PRIMARY KEY,
    nome           VARCHAR(50),
    concello         VARCHAR(50),
    camino         VARCHAR(50), #norte , portugues etc 
    num_prazas       INT,
    prezo_noite  DECIMAL(10,2) 
);