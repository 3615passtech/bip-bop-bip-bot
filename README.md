# Bip Bop Bip Bot

_A framework to write SMS bot in ruby, based on Sinatra micro framework and using Twillo service_

Originally written to build the super-smart chatbot of the **3615 PassTech** platform!

(WIP) Offer more services, like Facebook Messenger bot :)

## Quick Setup

```shell
# Install dependencies
bundle install

# Launch a dev server on http://localhost:4567
ruby main.rb

# Launch ngrok (https://ngrok.com/download)
ngrok http 4567
```

(WIP) You can test without sending SMS simply by using [http://localhost:4567/sms?Body="Hello PassTech"](http://localhost:4567/sms?Body="Hello%20PassTech") URL!
