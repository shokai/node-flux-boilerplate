Express Template (Chat App)
===========================

- [demo](https://express-chat-template.herokuapp.com/)
- [source code](https://github.com/shokai/express-template)

[![Build Status](https://travis-ci.org/shokai/express-template.svg?branch=master)](https://travis-ci.org/shokai/express-template)
[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

- coffee-script
- express 4.12.x
- socket.io 1.3.x
- React + Fluxxor + Browserify
- mongoose + connect-mongo
- jade
- grunt + coffeelint + mocha + supertest
- Heroku
- Travis CI


REQUIREMENTS
------------

- Node.js v0.12.x
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

### logs

    % heroku logs --num 300
    % heroku logs --tail


DEPLOY HOOK
-----------

edit `.travis.yml`.

- deploy to Heroku when Travis CI passed
