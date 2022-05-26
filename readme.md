# This is the deploy manual for this project
## Deploying instructions:
> OBS: Server onde estamos fazendo deploy: 10.255.255.88 :/dados/docker/elastic-dev

1. Step 1: git clone https://git.camvoip.com.br/foneatrnp/estatisticas/automated_databases_deploy.git
1. cd automated_database_deploy
1. editar docker-compose.yml <= comentar 2a e 3a linha do serviço elasticsearch.volumes
1. editar elasticsearch.yml <= comentar todas linhas que começam com xpack
1. sudo docker-compose up -d (HAVERÁ ERRO DE CONEXAO ELASTIC -> KIBANA. IGNORAR)
1. Rodar script de cópia de certificado 
1. sudo chmod 777 elastic-certificates.p12
1. sudo chmod -R 777 docker-data-volumes/
1. Desfazer os comentários feitos nos passos anteriores
1. sudo docker-compose down
1. sudo docker-compose up -d
1. sudo docker exec -it es01 bash
1. ./bin/elasticsearch-setup-passwords auto
1. copia as senhas e cola em um arquivo de senhas fora do container

> *COLAR AQUI AS SENHAS GERADAS NO PASSO 13*

15. Abre o kibana.yml e troca a senha do usuario kibana pra senha do usuário kibana que foi gerada acima, no campo elasticsearch.password
1. sudo docker-compose down
1. sudo docker-compose up
1. acessa o kibana via web, e usa as credenciais do usuario elastic que foram geradas acima.

FIM
