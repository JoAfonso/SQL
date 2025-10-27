CREATE DATABASE locadora_veiculos;
USE locadora_veiculos;

CREATE TABLE locadora (
    id_locadora INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(15),
    cnpj VARCHAR(14) UNIQUE NOT NULL
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    id_locadora INT,
    modelo VARCHAR(100),
    marca VARCHAR(50),
    ano INT,
    preco_diaria DECIMAL(10,2),
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_locadora) REFERENCES locadora(id_locadora)
);

CREATE TABLE aluguel (
    id_aluguel INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_veiculo INT,
    id_locadora INT,
    data_inicio DATE,
    data_fim DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo),
    FOREIGN KEY (id_locadora) REFERENCES locadora(id_locadora)
);
