#FASE 5
#ALTER

USE biblioteca_lafp;

# A tabela LAFP_PAGAMENTO permite descobrir qual multa pertence a cada pagamento
CREATE TABLE LAFP_PAGAMENTO (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    data_pagamento DATE NOT NULL,
    id_multa INT NOT NULL,

    FOREIGN KEY (id_multa)
    REFERENCES LAFP_MULTA(id_multa)
);

#Adiciona uma nova coluna
alter table LAFP_PAGAMENTO
add column forma_pagamento varchar(20);

#Modifica uma coluna
alter table LAFP_PAGAMENTO
modify column forma_pagamento varchar(30);

#Adiciona uma restricao default
alter table LAFP_PAGAMENTO
alter column forma_pagamento set default 'Cartão';

#Remove uma coluna 
alter table LAFP_PAGAMENTO
drop column forma_pagamento;


#Tabela teste criada para ser excluida
CREATE TABLE LAFP_TESTE (
    id_teste INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100)
);

#Exclusão da tabela teste criada para esta fim

drop table LAFP_TESTE;
