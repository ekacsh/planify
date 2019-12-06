#!/bin/sh
USER=user
PASS=user
mongoimport --drop --port 27001 --authenticationDatabase=admin -u $USER -p $PASS -d planify -c disciplinas disciplinas.json
mongoimport --drop --port 27001 --authenticationDatabase=admin -u $USER  -p $PASS -d planify -c anotacoes anotacoes.json
mongoimport --drop --port 27001 --authenticationDatabase=admin -u $USER -p $PASS  -d planify -c tarefas tarefas.json
