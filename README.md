# MOAC Explorers, thin and thick

## thin explorer
  - technology node.js
    - chain3.js
    - koa2
    - ws
  - feature
    - fast
    - light - no database
    - restful query api
    - simple explorer
  - future enhancement
    - restful update api

## thick explorer
  - techonology python3
    - django
    - postgresql
    - websocket
    - django rest framework
  - feature
    - precise
    - comprehensive
    - full explorer
  - future enhancement
    - concurrency
    - async

## supported
  - linux
  - macos

## docker image
  - use ubuntu 1804

## deployment
  - apache
  - nginx
  - haproxy

## test
  - thin explorer
    - mkdir koa
    - git checkout ??? koa
    - cd koa
    - npm install
    - npm start
    - test /api/block/:args /api/tx/:args /api/address/:args
    - (screen session) node feed-ws.js
    - browse http://localhost:3000
  - think explorer
    - mkdir django
    - git checkout ??? django
    - cd django
    - ./manage.py migrate ;
    - (screen session) ./manage.py sync_ledger --moac 
    - ./manage.py runserver
    - browse http://localhost:8000

## requirements
  0. have moac running with --rpc option
  1. have node.js >= 8
  2. have python >= 3.6
  3. have git available
