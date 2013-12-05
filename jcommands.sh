#!/bin/bash

# DB Migrations and Model Generation
rails g resource user email:string password_digest:string << &userMigration: params >> --force
rails g model content description:text title:string user:references << &contentMigration: params >> --force

<< &jCommands: _global >>

# Controller + Misc Generation
rails g controller contents --force
rails g controller sessions --force

# DB Migration and Seeding
rake db:drop
rake db:migrate
