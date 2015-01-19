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

  - [GET /users/:user_id/likes](#get-usersuser_idlikes)
  - [GET /users/:user_id/likes/:id](#get-usersuser_idlikesid)
  - [POST /users/:user_id/likes](#post-usersuser_idlikes)

### Matches

  - [GET /users/:user_id/matches](#get-usersuser_idmatches)
  - [GET /users/:user_id/matches/:id](#get-usersuser_idmatchesid)


### GET /users

List all users

Response:

    [
      {
        "_id": {
          "$oid": "54bbf2fc456477070a060000"
          },
          "age": 28,
          "created_at": "2015-01-18T17:53:32.805Z",
          "email": "coco@gmail.com",
          "gender": "male",
          "rank": 0,
          "updated_at": "2015-01-18T19:52:55.304Z",
          "user_name": "coco"
        },
        {
          "_id": {
            "$oid": "54bbf321456477070a070000"
            },
            "age": 21,
            "created_at": "2015-01-18T17:53:59.741Z",
            "email": "andre@gmail.com",
            "gender": female,
            "rank": 0,
            "updated_at": "2015-01-18T17:53:59.741Z",
            "user_name": "andrea"
        }
      ]

### GET /users/:id

Shows user data

Response:

    {
      "_id": {
        "$oid": "54bbf2fc456477070a060000"
       },
       "age": 28,
       "created_at": "2015-01-18T17:53:32.805Z",
       "email": "coco@gmail.com",
       "gender": "male",
       "rank": 0,
       "updated_at": "2015-01-18T19:52:55.304Z",
       "user_name": "coco"
    }

### GET /users/:id/compatible_users

Returns a list of compatible users for user :id

### POST /users

User registration

Parameters:

* user_name
* email
* orientation
* age
* gender
* age_range

List of valid age_range:

    "10 - 14", "15 - 21", "22 - 29", "30 - 40", "41 - 70", "71 - 120"

Request:

    {
      "user_name":"steve"
      "email":"steve_jobs@gmail.com",
      "age":"56",
      "gender":"male",
      "orientation":"both",
      "age_range":"21 - 29"
    }



### POST /sign_in

Request:

    {
      "user_name":"steve"
    }


### GET /users/:user_id/likes

List all likes from user_id

Response:

    [
      {
        "_id": {
          "$oid": "54bc2bea456477080c110000"
         },
        "created_at": "2015-01-18T21:55:54.269Z",
        "to_user_id": "54bbf2fc456477070a060000",
        "updated_at": "2015-01-18T21:55:54.269Z",
        "user_id": {
          "$oid": "54bc1cb5456477080c090000"
        }
      },
      {
        "_id": {
          "$oid": "54bc389c4564770d65010000"
        },
        "created_at": "2015-01-18T22:50:04.643Z",
        "to_user_id": "54bbf321456477070a070000",
        "updated_at": "2015-01-18T22:50:04.643Z",
        "user_id": {
          "$oid": "54bc1cb5456477080c090000"
        }
      }
    ]

### GET /users/:user_id/likes/:id

Returns a specific like

Response:

    {
      "_id": {
        "$oid": "54bc2bea456477080c110000"
      },
      "created_at": "2015-01-18T21:55:54.269Z",
      "to_user_id": "54bbf2fc456477070a060000",
      "updated_at": "2015-01-18T21:55:54.269Z",
      "user_id": {
        "$oid": "54bc1cb5456477080c090000"
      }
    }

### POST /users/:user_id/likes

Creates a new like from :user_id

Parameters:

* to_user_id

Request:

    {
      "to_user_id":"54bc1cb5456477080c090000"
    }


### GET /users/:user_id/matches

List all matches for :user_id

### GET /users/:user_id/matches/:id

Shows a specific match
