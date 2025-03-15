#Definição do repositório (node/alpine)
FROM node:22-alpine

#Definição de labels para ajudar a identificar as imagens
LABEL desenvolvedor="Ana Carolina dos Anjos"
LABEL descricao="Imagem para projetos do curso 'ReactJS 18 com TypeScript do Zero ao Profissional + Projetos'"

#Usado comando RUN para instalar os pacotes necessários para rodar o React 19
RUN apk add --no-cache npm
RUN npm install -g npm@11.1.0

#Definição do diretório que onde será trabalhado os próximos comandos
WORKDIR /app

#Copiando Tudo da minha pasta original, com o básico de projeto React 19 usando VITE para o diretório definido no WORKDIR
COPY . ./TodoList

#Definição do diretório que onde será trabalhado os próximos comandos
WORKDIR /app/TodoList

#Indicação de que a porta utilizada na imagem é a 5173
EXPOSE 5173

#Adiciona a variável de ambiente para ativar um modo alternativo de detecção de mudanças. [Para usar bindmount no docker]
ENV CHOKIDAR_USEPOLLING=1

#Faz a instalação dos arquivos do React
RUN npm install 

# Comando para iniciar o servidor de desenvolvimento
CMD ["npm", "run", "dev"]