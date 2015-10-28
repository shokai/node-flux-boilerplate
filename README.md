node-flux-boilerplate
=====================
react+fluxxor+socket.io chat

- [demo](https://node-flux-boilerplate.herokuapp.com/)
- [source code](https://github.com/shokai/node-flux-boilerplate)

[![Build Status](https://travis-ci.org/shokai/node-flux-boilerplate.svg?branch=master)](https://travis-ci.org/shokai/node-flux-boilerplate)
[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

- ES6(babel) + ESLint
- express 4.13.x
- socket.io 1.3.x
- React 0.14 + Fluxxor 1.7 + Browserify
- mongoose + connect-mongo
- jade
- mocha + supertest
- Heroku
- Travis CI


REQUIREMENTS
------------

- Node.js v4.x
- MongoDB v3.x


DEVELOP
-------

    % npm run watch
    % PORT=3000 DEBUG=chat* npm start

DEPLOY
------

    % export NODE_ENV=production
    % npm run build
    % PORT=3000 DEBUG=chat* npm start

TEST & LINT
-----------

    % npm test

DEPLOY to Heroku
----------------

### create app

    % heroku apps:create my-heroku-app-name
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
