CREATE TABLE dm_animal (
    animal_id INT PRIMARY KEY,
    tipo_animal VARCHAR(50) NOT NULL
);

CREATE TABLE dm_regiao (
    regiao_id INT PRIMARY KEY,
    nome_regiao VARCHAR(100) NOT NULL
);

CREATE TABLE dm_uf (
    estado_id INT PRIMARY KEY,
    nome_estado VARCHAR(100) NOT NULL,
    regiao_id INT,
    FOREIGN KEY (regiao_id) REFERENCES dm_regiao(regiao_id)
);

CREATE TABLE dm_abate (
    abate_id INT PRIMARY KEY,
    animal_id INT,
    estado_id INT,
    trimestre VARCHAR(20) NOT NULL,
    ano INT NOT NULL,
    num_informants INT,
    qtd_abtd INT,
    peso_carcacas DECIMAL(15, 2),
    FOREIGN KEY (animal_id) REFERENCES dm_animal(animal_id),
    FOREIGN KEY (estado_id) REFERENCES dm_uf(estado_id)
);
