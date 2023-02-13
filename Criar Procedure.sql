--CRIANDO TODAS AS TABELAS--
CREATE TABLE produto(
  id serial PRIMARY Key,
  descricao VARCHAR(100) NOT NULL,
  valor NUMERIC(5,2),
  quantidade int,
  mensagem VARCHAR(30)
);

CREATE TABLE cliente(
  id serial PRIMARY KEY,
  nome VARCHAR(30) NOT NULL,
  email VARCHAR(30) NOT NULL
);

create table cliente_produto(
  fk_id_cliente INT,
  fk_id_produto INT,
  quantidade int,
  valor_total NUMERIC(5,2),
  CONSTRAINT fk_id_cliente FOREIGN key(fk_id_cliente) REFERENCES cliente(id),
  CONSTRAINT fk_id_produto FOREIGN key(fk_id_produto) REFERENCES produto(id),
  CONSTRAINT pk_cliente_produto PRIMARY KEY(fk_id_cliente,fk_id_produto)
);

--INSERINDO DADOS EM TODAS AS TABELAS--
INSERT INTO cliente(nome,email) VALUES
('Chaves','chaves8@gmail.com.mx'),
('Seu Madruga','domramon@gmail.com.mx'),
('Dona Florinda','florindameza@gmail.com'),
('Quico','frederico@gmail.com'),
('Bruxa 71','clotilde@gmail.com'),
('Chiquinha','fransiquinha@gmail.com'),
('Nhonho','nhohno@gmail.com');

select * from cliente;

INSERT into produto(descricao,valor,quantidade,mensagem) VALUES
('Bola Quadrada',20.50,30,'Estoque ok'),
('Zarabatana e chumbinho',3.50,20,'Estoque ok'),
('Pirulito da vanda da esquina',1.00,50,'Estoque ok'),
('Farinha para churos',2.50,30,'Estoque ok'),
('Album de figurinhas',5.00,50,'Estoque ok'),
('Varinha magica',1.50,5,'Estoque ok'),
('Cola de sapateiro',2.00,15,'Estoque ok'),
('Chapeu e roupas usadas',10.00,10,'Estoque ok'),
('Bola de boliche',35.50,5,'Estoque ok'),
('Suco de limao, que é de groselha e parece tamarindo',1.50,30,'Estoque ok'),
('Sanduiche de presunto',1.50,10,'Estoque ok'),
('14 ovos e 32 sucos de frutas',45.50,2,'Estoque ok'),
('carambola',1.00,50,'Estoque ok'),
('Bilhete de loteria',2.50,100,'Estoque ok'),
('panqueca',2.00,10,'Estoque ok');

--CRIANDO UMA PROCEDURE--
create or replace procedure verificarEstoque()
language plpgsql
as $$
declare

begin
	SELECT descricao,quantidade from produto;
end; $$

--CHAMANDO PROCEDURE--
call verificarEstoque();


