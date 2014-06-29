Express Template (Chat App)
===========================

- https://express-chat-template.herokuapp.com/
- https://github.com/shokai/express-template


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
