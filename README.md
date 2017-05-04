[![Dajare](https://github.com/satoryu/dajare/raw/master/public/dajare.jpg)](https://github.com/satoryu/dajare)

# What's this?

This is a Web application to help to generate dajares easily.
This also has endpoints to work as HipChat Add-on.
This add-on will start converting all message in rooms if you install the rooms.

The demo server is running on Heroku. [Try it!](https://dajare.herokuapp.com/)

Or deploy it!

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

# Prerequiresites

* Ruby 2.3.3 or later

# Install

## Install into your server

```
  $ git clone http://github.com/satoryu/dajare
  $ cd dajare
  $ bundle install 
  $ bundle exec rackup # Launch Dajare server
```

## Install it as a HipChat integration

Suppose your dajare server is running on `https://dajare.example.com`.

  1. Visit your integrations dashboard like https://youraccount.hipchat.com/addons/
  2. Click `'Install an integration from a descriptor URL'` at the bottom of the dashboard.
  3. Fill in Descriptor URL with `https://dajare.example.com/descriptor`
  4. Click `Continue` then click `Approve`. 
  5. Done!


# Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/satoryu/dajare. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

For developers,

  1. Fork it
  2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Add some feature'`)
  4. Push to the branch (`git push origin my-new-feature`)
  5. Create new Pull Request

<a href='https://pledgie.com/campaigns/16591'><img alt='Click here to lend your support to: pebbles-dajare and make a donation at pledgie.com !' src='https://pledgie.com/campaigns/16591.png?skin_name=chrome' border='0' ></a>

# LICENSE

The MIT License

Copyright (c) 2012 Tatsuya Sato

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWAblish, distribute, sublicense, and/or sell
copie
