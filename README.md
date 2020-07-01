# Dajare (駄洒落)

[![Dajare](https://github.com/satoryu/dajare/raw/master/public/dajare.jpg)](https://github.com/satoryu/dajare)

## What's this?

This is a Web application to help to generate dajares easily.
This also has endpoints to work as HipChat Add-on.
This add-on will start converting all message in rooms if you install the rooms.

The demo server is running on Heroku. [Try it!](https://dajare.herokuapp.com/)

Or deploy it!

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

### Prerequiresites

* Ruby 2.3.3 or later

## Install

### Install into your server

```sh
  git clone http://github.com/satoryu/dajare
  cd dajare
  bundle install
  bundle exec rackup # Launch Dajare server
```

### Install it as a HipChat integration

Suppose your dajare server is running on `https://dajare.example.com`.

  1. Visit your integrations dashboard like https://youraccount.hipchat.com/addons/
  2. Click `'Install an integration from a descriptor URL'` at the bottom of the dashboard.
  3. Fill in Descriptor URL with `https://dajare.example.com/descriptor`
  4. Click `Continue` then click `Approve`.
  5. Done!
