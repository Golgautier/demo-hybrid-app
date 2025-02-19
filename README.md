# demo-hybrid-app

## Purpose
Repo for demo with Nutanix SelfService, to deploy a hybrid app : VM &amp; pods

## Usage 
Deploy the app on you Nutanix Self-sevice and run it after customization (look at [readme](Blueprint/Readme.md))

## Add an app
If you want to add an app to deploy through the BP : 
- Create a new rep in the repo endig with `App`
- Your app must run on port 8080
- Put your app in this folder.
  - A Dockerfile must exist to create the container image
  - A sql folder must contain the sql code to execute to initilize the DB
