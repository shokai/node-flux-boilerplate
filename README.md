Express Template (Chat App)
===========================

- [demo](https://express-chat-template.herokuapp.com/)
- [source code](https://github.com/shokai/express-template)


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
