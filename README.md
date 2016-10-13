# Cabletest1

My sample app for using ActionCable and websockets with Redis to keep a connection open.

This app is the chatoom app from a [heroku blog](https://blog.heroku.com/real_time_rails_implementing_websockets_in_rails_5_with_action_cable) post
with a coupke of minor modifications.

# Have a go

Clone it.
```
rails db:migrate
rails db:seed

rails server -p3333 
```

You don't have to use port 3333 but if you don't, you'll need to change the ports in ```config/environments/development.rb``` at the bottom of that file.
Also, if you don't have your own Redis server running locally, change ```config/cable.yml``` to the 'async' setting in development.
