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



DEPLOY
------

    % heroku create
    % git push heroku master

config

    % heroku config:add TZ=Asia/Tokyo
    % heroku addons:add mongolab
    % heroku config:set "DEBUG=chat*"
    % heroku config:set NODE_ENV=production

logs

    % heroku logs --num 300
    % heroku logs --tail