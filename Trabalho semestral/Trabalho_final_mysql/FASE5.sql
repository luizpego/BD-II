
USE biblioteca_lafp;

-- Cria uma nova tabela relacionada aos usuarios.
CREATE TABLE LAFP_CONTATO_EMERGENCIA (
    id_contato INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    parentesco VARCHAR(60),
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario)
        REFERENCES LAFP_USUARIO(id_usuario)
);


-- Adiciona uma nova coluna na tabela de usuarios.
ALTER TABLE LAFP_USUARIO
ADD COLUMN observacoes VARCHAR(200);


-- Aumenta o tamanho da coluna endereco.
ALTER TABLE LAFP_USUARIO
MODIFY COLUMN endereco VARCHAR(400);


-- Adiciona um valor padrao para o cargo dos funcionarios.
ALTER TABLE LAFP_FUNCIONARIO
ALTER COLUMN cargo SET DEFAULT 'Atendente';


-- Remove a coluna observacoes da tabela de usuarios.
ALTER TABLE LAFP_USUARIO
DROP COLUMN observacoes;


-- Cria uma tabela auxiliar para importacao de dados.
CREATE TABLE LAFP_IMPORTACAO_TEMPORARIA (
    id_importacao INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(200)
);


-- Exclui a tabela auxiliar porque ela nao sera mais utilizada.
DROP TABLE LAFP_IMPORTACAO_TEMPORARIA;
