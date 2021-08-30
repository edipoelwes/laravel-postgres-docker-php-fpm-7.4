## Instruções para o desenvolvimento

***Dica***: Para acessar o container e executar comandos como `composer install` ou `npm install`, execute o comando `docker exec -ti app_php /bin/bash`.

# Parametrizar a API

- Após clonar o projeto desafio-maxmilhas
   1. Através do terminal, entre no diretório do projeto `cd <projeto>`
   2. Execute `docker-compose up -d --build`

   3. clonar o projeto laravel ou baixar um projeto novo `docker-compose exec app composer create-project laravel/laravel example-app`

    - remover a pasta public da raiz do projeto `sudo rm -rf public`
    - mover todo o conteudo da pasta do projeto laravel para a pasta raiz do docker `sudo mv * ../`
    - mover todo o conteudo oculto da pasta do projeto laravel para a pasta raiz do docker `sudo mv .* ../`
    - remover a pasta do projeto laravel que agora esta vazia da raiz do projeto `sudo rm -rf public`

   3.1. execute o comando `docker-compose exec app composer install` no caso de ter clonado o projeto.
   4. execute o comando `docker-compose exec app chmod -R 777 storage` para da permissão para a pasta storage.

   5. Copie o arquivo `.env-example` para `.env`
   5.1. Execute o comando `docker-compose exec app php artisan key:generate`.
   6. Configurar as variaveis de ambientes do banco    
   
   *Postgres*:
      - connection: pgsql
      - host: db
      - port: 5432
      - dbname: laravel
      - username: postgres
      - password: postgres

   7. Execute o comando `docker-compose exec app php artisan migrate`.
   
   # Acessar o rota `http://localhost:8081`.

#IMPORTANTE
*Se por algum motivo precisar refazer a build da imagem, apagar a pasta postgres de dentro do .docker*
