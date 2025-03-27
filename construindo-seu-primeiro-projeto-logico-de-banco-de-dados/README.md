# 🚀 Construindo seu Primeiro Projeto Lógico de Banco de Dados

Neste projeto montamos uma simulação simples de uma estrutura de banco de dados para um pequeno projeto de [Comércio Eletrônico](https://pt.wikipedia.org/wiki/Comércio_eletrônico).

## Projeto Conceitual
Abaixo você pode visualizar o relacionamento entre as tabelas para mais detalhes abra o [drawio](ER.drawio), você acessa-lo pela web, através de [app.diagrams.net](https://app.diagrams.net).

::: mermaid
erDiagram
    CLIENT ||--|{ ORDERS : gera
    CLIENT ||--|{ PAYMENTS : contem
    PAYMENTS ||--|| ORDERS : compoem
    ORDERS_PRODUCT ||--|{ PRODUCT : contem
    ORDERS_PRODUCT ||--|{ AFFILIATE_PRODUCT : contem
    AFFILIATE_PRODUCT ||--|{ PRODUCT : contem
    STOCK_PRODUCT ||--|{ PRODUCT : contem
    SUPPLIER_PRODUCT ||--|{ PRODUCT : contem
    ORDERS ||--|{ ORDERS_PRODUCT : gera 
    AFFILIATE ||--|{ AFFILIATE_PRODUCT : gera 
    STOCK ||--|{ STOCK_PRODUCT : gera 
    SUPPLIER ||--|{ SUPPLIER_PRODUCT : gera 
:::

## Projeto Lógico
Para facilitar o entendimento os projeto logico foi separado em 3 categorias

### DDL (Data Definition Language)

Aqui a construção do banco de dados é realizada, você deverá ter um SGBD instalado em sua maquina, o oque utilizado para o desenvolvimento do projeto foi o [MariaDB 11.1.2](https://mariadb.com/kb/en/mariadb-11-1-2-release-notes/). Abaixo baixa-lo você pode utilizar um IDE para realizar a leitura do arquivo [DDL.sql](DDL.sql) e carrega-lo para o SGBD, a IDE utilizada no desenvolvimento do projeto foi [HeideSQL](https://www.heidisql.com), porém caso tenha outro de preferencia não há problema em utiliza-lo.

### DML (Data Manipulation Language)

> [!WARNING]
>
> Você deve primeiro realizar a etapa anterior antes de realizar está, visto que está tem como objetivo adicionar registros ao banco de dados, logo se o mesmo não existir, poderá haver conflitos erros.

Para realizar uma melhor simulação alguns dados ficticios foram adicionados, para importa-los para o Banco de dados basta realizar a execução de [DML.sql](DML.sql), semelhante a como executou a do [DDL](#ddl-data-definition-languageDDL)

### DQL (Data Query Language)

Por fim após ter uma gama interessante de dados você está pronto para manipular a extração das informações de diversas formas diferentes, o arquivo [DQL.sql](DQL.sql), possui algumas ideias simples de realizações de consultas, nele você poderá ver interações entre tabelas, agrupamentos e transformação dos dados.

