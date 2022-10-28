# To up docker

Execute:

'''docker-compose run --no-deps web rails new . --force --database=postgresql'''

Depois:

'''sudo chown -R $USER:$USER . ''''

Configue db:

host: db
username: postgres
password: password

Depois:

'''docker-compose run web rake db:create''''

Depois:

'''docker-compose build''

Depois:

'''docker-compose up'''


## Resposta da questão 3.1

A quary do index não tem problema algum ela vai executar o seguinte comando no banco de dados:

'''SELECT * FROM customers ORDER BY name'''

A não ser o problema de trazer todos os registros no banco. Que pode causar lentidão dependendo a quantidade de registros no banco.

Esse problema pode ser contornado usando a gema Paginate, com eta gema teriamos uma query parecida com isso:

Customer.paginate(page: 1, size: 100)


## Resposta da questão 3.2

post '/block/:id', to 'customers#block'

## Resposta da questão 3.3

A query poderia ser feita em action#show
    @customer_orders = Customer.orders.all

O html se encontra na pasta Question 3.3