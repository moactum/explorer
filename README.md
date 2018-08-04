# MOAC Explorers, thin and thick

## thin explorer
  - technology node.js
    - chain3.js
    - koa2
    - ws
  - feature
    - fast
    - lightweight - no database
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

## docker and k8s
  - later

## deployment
  - nginx
  - haproxy

## production environment
  - http://moac.guru

## test
  - thin explorer
    - git submodule update --init koa
    - cd koa
    - npm install
    - screen session for web service with websocket
      - node app.js
    - screen session for websocket feed
      - node feed-ws.js
    - test api query
      - /api/block/:number_or_hash
      - /api/uncle/:number_or_hash/:index
      - /api/tx/:args
      - /api/address/:address
      - /api/address/:address/{code,balance,log}
      - /api/log/:startblock/:endblock
        - /api/search/:searchterm
    -  web browser
      - http://localhost:3000
        - test live update
        - test search
      - some links visit the thick explorer
  - thick explorer
    - thin explorer working
    - git submodule update --init django
    - cd django
    - pip3 install -r requirements.txt
    - ./manage.py migrate ; ./manage.py makemigrations; ./manage.py migrate
    - screen sessions, sychronize from moac to database, calls api from the thin explorer above
      - ./manage.py sync
      - celery worker -c4 -A moacscan.celery
    - screen session, run the web server
      - ./manage.py runserver
    - browse http://localhost:8000

## pre-requirements
  0. have local moac running with --rpc option
    1. --rpcaddr 0.0.0.0 if not on localhost, update koa/config.js and django/local_settings.py in this case)
  1. have git available
  2. have node.js >= 8
  3. have python3 >= 3.6, virtualenv is recommended
  4. have local postgresql service running and psql works
    1. createdb moacscan
  5. have local redis running

## references
  - django project
    - https://www.djangoproject.com/
  - learn javascript
    - https://www.liaoxuefeng.com
  - moac
    - https://github.com/MOACChain/moac-core
  - chain3
    - https://github.com/innowells/Chain3
