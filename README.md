lighter
========

Lighter internal API

# Overview

The RESTful API described here provides a
single interface for many user-likes-matches modalities.

# Development

## Getting things done locally

- Download and install NodeJS from [http://blog.teamtreehouse.com/install-node-js-npm-mac](http://blog.teamtreehouse.com/install-node-js-npm-mac)
- Install Bower using the following command

```shell

$ npm install bower -g

```

- Make sure to install the required gems

```shell

$ bundle install

```

- Install bower dependencies (Read bower.json)

```shell

$ rake bower:install

```

- Start Rails server

```shell

$ rails s

```

- Now you should be able to start playing around with the API on:

http://localhost:3000/v1/

## API Resources

### Users

  - [GET /users](#get-users)
  - [GET /users/:id](#get-id)
  - [GET /users/:id/compatible_users](#get-id-compatible_users)
  - [POST /users](#post-users)
  - [POST /sign_in](#post-sign_in)


### Likes

  - [GET /users/:user_id/likes](#get-users-user-id-likes)
  - [GET /users/:user_id/likes/:id](#get-users-user_id-likes-id)
  - [POST /users/:user_id/likes](#post-users-user_id-likes)

### Matches

  - [GET /users/:user_id/matches](#get-users-user-id-matches)
  - [GET /users/:user_id/matches/:id](#get-users-user_id-matches-id)
