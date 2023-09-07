FROM ubuntu:latest

RUN apt update
# rodar comandos dentro do container
RUN apt install nginx -y 

# mapeia o diretório que temos dentro do container
VOLUME ["var/www/html"]

# define como espaço de trabalho - todos os comandos apartir do workdir vai ser feito dentro deste diretório
WORKDIR "/var/www/html"

ADD index.html index.html

# passa uma instrução de comando - cmd por ser sobre-escrido
CMD [ "/usr/sbin/nginx", "-g", "daemon off;" ]

# passa uma instrução de comando - não pode ser sobre-escrito
# ENTRYPOINT [ "/usr/sbin/nginx", "-g", "daemon off;" ]

EXPOSE 80

# docker build . -t nome:versão(teste:latest)
# docker run -p 80:80 teste:latest