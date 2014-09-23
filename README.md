Express Template (Chat App)
===========================

- [demo](https://express-chat-template.herokuapp.com/)
- [source code](https://github.com/shokai/express-template)

[![Build Status](https://travis-ci.org/shokai/express-template.svg?branch=master)](https://travis-ci.org/shokai/express-template)
[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

- express 4.4
- socket.io 1.1
- mongoose 3.8 + connect-mongo
- jade
- coffee-script on browser
- grunt + coffeelint + mocha + supertest
- Heroku
- Travis CI


REQUIREMENTS
------------

- Node.js v0.10.x
- MongoDB v2.x


RUN
---

    % npm install
    % PORT=3000 DEBUG=chat* npm start


TEST & LINT
-----------

    % npm test

or

    % npm i grunt-cli -g
    % grunt


DEPLOY
------

### create app

    % heroku create
    % git push heroku master

### config

    % heroku config:add TZ=Asia/Tokyo
    % heroku config:set "DEBUG=chat*"
    % heroku config:set NODE_ENV=production

### enable MongoDB plug-in

    % heroku addons:add mongolab
    # or
    % heroku addons:add mongohq

### enable WebSocket

    % heroku labs:enable websockets

### logs

    % heroku logs --num 300
    % heroku logs --tail


DEPLOY HOOK
-----------

edit `.travis.yml`.

- deploy to Heroku when Travis CI passed
