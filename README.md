### Perennial: Renewals Tracking App

Perennial is a single page application designed for keeping track of a user's upcoming monthly or yearly renewals.

I came up with the idea for Perennial after my husband and I realized our car registration was expired...by almost a year. It got me thinking about all of the subscriptions, plans, etc. that we have to keep track of and how tough it can be to keep it all straight. I wanted to create a user-friendly application that store all of the data a user might need about their renewals, including expiration dates, comments, and instructions on each individual renewal.

## Setup Steps:

- Fork and clone this repository.
- Create and checkout to a new branch to begin your work.
- Run `npm install` to install all dependencies
- Use `npm run server` to spin up the server.

## Important Links:
- [Perennial Client Repository](https://github.com/MelNesbitt12/Perennial-client)
- [Perennial Deployed API](https://murmuring-sands-59392.herokuapp.com/)
- [Perennial Deployed Client](https://melnesbitt12.github.io/Perennial-client)

## Planning Story:
For this project, I wanted to be as organized as possible from the start, so I used smartsheet to make a list of all requirements I needed to meet in order to reach MVP, as well as a list of stretch goals/extras I wanted to incorporate if I had time. After creating and populating my smartsheet, I moved on to my ERD and wireframes, as well as user stories.

I began by setting up both my front and back end repositories and using curl scripts to check authentication on both the front and back end. After confirming my curl scripts worked, I focused on the back end: creating my renewal resource and all its endpoints, testing my ability to CRUD the resource with curl scripts, and adding the relationship and ownership of the user to the renewal resource.

Then I moved on to the front end: I created my resource, tested CRUD (create, update, delete, index and show) with curl scripts and in the browser, and made sure that all actions had success and failure messages associated with them.

Styling came last - for this project, I wanted to continue to practice using Bootstrap, so I incorporated Cards and a Jumbotron. I also did most of my styling with inline CSS.

## User Stories:
- As a user I want to sign in/up
- As a user I want to be able to change my password
- As a user I want to be able to log out
- As a user I want to Create a new renewal
- As a user I want to View multiple renewals
- As a user I want to View a single renewal
- As a user I want to Update a renewal I own
- As a user I want to Delete a renewal I own
- As a user I want to be able to comment on renewals I own
- As a user I want to see an expiration countdown on each renewal

## Technologies Used:
- Express
- HTML/CSS
- Bootstrap
- Javascript
- MongoDB
- Mongoose

## Tasks

`npm` is used as a task runner for this project. These are the commands available:

| Command                | Effect                                                                                                      |
|------------------------|-------------------------------------------------------------------------------------------------------------|
| `npm run server`       | Starts a development server with `nodemon` that automatically refreshes when you change something.                                                                                         |
| `npm test`             | Runs automated tests.                                                                                       |
| `npm run debug-server` | Starts the server in debug mode, which will print lots of extra info about what's happening inside the app. |

## API Authentication


| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/` | `users#changepw`  |
| DELETE | `/sign-out/`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl --include --request POST http://localhost:4741/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "username": "username",
      "email": "an@example.email",
      "password": "an example password",
      "password_confirmation": "an example password"
    }
  }'
```

```sh
curl-scripts/auth/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "username": "username"
  }
}
```

#### POST /sign-in

Request:

```sh
curl --include --request POST http://localhost:4741/sign-in \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "username": "username",
      "password": "an example password"
    }
  }'
```

```sh
curl-scripts/auth/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "username": "username",
    "token": "33ad6372f795694b333ec5f329ebeaaa"
  }
}
```

#### PATCH /change-password/

Request:

```sh
curl --include --request PATCH http://localhost:4741/change-password/ \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "an example password",
      "new": "super sekrit"
    }
  }'
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa curl-scripts/auth/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/

Request:

```sh
curl --include --request DELETE http://localhost:4741/sign-out/ \
  --header "Authorization: Bearer $TOKEN"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa curl-scripts/auth/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```
## Unsolved Problems:
Version 2:
- I would like to create a subdocument within the Renewal model for comments.
- I want users to be able to add hyperlinks (instead of just text links) to the `URL` section of the create renewal form, so that they can click the link from the show page and be taken straight to their subscription or service renewal page
- I want to explore bootstrap styling and have my individual resource cards lay out side-by-side instead of stacked on the index page.
- I want to add mobile compatibility to the application.
- I would like to adjust my User schema to include location and other pertinent information for the User's profile page.

## Images
![Perennial App](https://user-images.githubusercontent.com/59749085/93626999-4841fb00-f9b2-11ea-9071-871391b79d3d.png)

#### ERD:
![Perennial ERD](https://user-images.githubusercontent.com/59749085/93627672-462c6c00-f9b3-11ea-9ef0-f909103ab283.jpg)
