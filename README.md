## Overview
This is going through: https://gorails.com/episodes/our-first-api to build an API
* Build API with versioning that returns json objects
* Create two rails models using generators

## Original Source Code:
https://github.com/gorails-screencasts/weather-api.git

## Create a new Rails App
```
rails new weather
```

## Generate Location Model
```
rails g model Location name		# generates a Location object with a name property
```

## Generate Recording Model
```
rails g model Recording location:references temp:integer status
```

This creates a belongs_to relationship on the record model to the location model
```
class Recording < ApplicationRecord
  belongs_to :location
end
```

and in the DB migrations, we see:
```
create_table :recordings do |t|
      t.references :location, foreign_key: true
```

## DB Migrations
```
rake db:migrate
```


## Seeing the DB
```
rake db:seed
```

## Running the Rails Console
```
rails c  # rails console
```


## Get Last Location with Last Temperature Recordings
Location.last.recordings.last


## List all of your routes
```
rake routes
```

## Calling our API
We can call our API via:
```
curl http://localhost:3000/api/v1/locations/1
```

## JWT

### Getting a JWT Token
```
curl --data "auth[email]=chris@gorails.com&auth[password]=password" http://localhost:3000/api/v1/user_token
```

### The Payload
The middle part the of the JWT holds the payload, you can base64 decode this using `window.atob(""")`

```
window.atob("eyJleHAiOjE1MTk3Mzg4NzgsInN1YiI6MSwiYWRtaW4iOnRydWUsImVtYWlsIjoiY2hyaXNAZ29yYWlscy5jb20ifQ")
```
which produces: `"{"exp":1519738878,"sub":1,"admin":true,"email":"chris@gorails.com"}"`


```