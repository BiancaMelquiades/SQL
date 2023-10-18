-- Consultas - junções e subconsultas
INSERT INTO usuarios (nome, email, data_nascimento, rua, numero, cidade, estado) VALUES ('Usuario sem reservas', 'semreservar@teste.com', '1990-10-10', 'Rua','123','cidade','estado');

-- Traz apenas os usuario com reservas (presente nas duas tabelas)
SELECT * FROM usuarios us --origem
INNER JOIN reservas rs --destino
	ON us.id = rs.id_usuario; --origem = destino

-- Traz todos os usuario e suas reservas se tiver
SELECT * FROM usuarios us
INNER JOIN reservas rs
	ON us.id = rs.id_usuario;

-- inrindo novo destino 
INSERT INTO viagens.destinos ( nome, descricao) VALUES 
('Destino sem reserva', 'Uma bela praia com areias brancas e mar cristalino')

-- Trás todos os destinos e as reservas se tiverem da tabela da direita -- 
SELECT * FROM reservas rs
RIGHT JOIN destinos des
	ON des.id = rs.id_destino;

-- Trás todos os destinos e as reservas se tiverem da tabela da direita
SELECT * FROM destinos des
LEFT JOIN reservas rs
	ON des.id = rs.id_destino;

-- SUb consultas

-- Pode ser usada junto aos filtros: SELECT / FROM / WHERE / HAVING / JOIN
-- Sub-Consulta devolve um resultado que pode ser utilizado em outra consulta


-- Usuários que não fizeram nenhuma reserva

SELECT nome
FROM usuarios
WHERE id NOT IN (SELECT id_usuario FROM reservas);

-- Subconsulta para encontrar os destinos menos populares (com menos reservas):

SELECT nome
FROM destinos
WHERE id NOT IN (SELECT id_destino FROM reservas)
ORDER BY id;

-- contagem de reservas por usuario

SELECT nome, (SELECT COUNT(*) FROM reservas WHERE id_usuario = usuarios.id) AS total_reservas
FROM usuarios;
