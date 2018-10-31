# Bip Bop Bip Bot

_The super smart chatbot of the [3615 PassTech](https://passtech.io) platform!_


## Quick Setup

```shell
# Install dependencies
bundle install

# Launch a dev server on http://localhost:4567
ruby main.rs

# Launch ngrok (https://ngrok.com/download)
ngrok http 4567
```

You can test without sending SMS simply by using [http://localhost:4567/sms?Body="Hello PassTech"](http://localhost:4567/sms?Body="Hello%20PassTech") url!


## Technical Roadmap

General philosophy:

- We only take explicit criteria, given actively by the user
- The code source is open, the database is private, even for us

### v0.1:

- [x] Subscribe the bot as an app in Facebook Developer Console
- [x] Handling Facebook Messenger messages
- [x] The bot asks the same questions than TypeForm (https://nicolashovart.typeform.com/to/ILIfu6 & https://nicolashovart.typeform.com/to/yw4YBp)
- [ ] User answers are saved in a Google Sheets table (https://docs.google.com/spreadsheets/d/1C_CWBPawipu7CfW9c14RhqY16Q2RAddRy1pshNh7-80 & https://docs.google.com/spreadsheets/d/1px0QxVZeiUX8bOlWeQF-7Gd015pkQWoFDjLSVGZiThM)
- [x] The bot doesn’t suggest a training at the end of the form
- [x] The technology used is https://labs.typeform.com/cui/

### v0.2:

- [ ] The bot answers a top 3 of suggested training at the end of the conversation
- [x] Questions are the same for all users and are asked in the same order
- [x] A quick specification draft of the user path can be found here https://github.com/3615passtech/bip-bop-bip-bot/wiki/Functionnal-Specifications
- [ ] The suggestion given to user is hardcoded through a decision three
- [ ] The bot store questions asked by users in a Firebase DB
- [x] The technology used is https://chatfuel.com/

### v0.3:

- The bot logic is handled by a web application
- A top 5 is given to user, 2 of the 5 five suggestions are randomly generated
- The app is implemented in Ruby using https://github.com/jgorset/facebook-messenger and following https://chatbotslife.com/create-a-facebook-messenger-bot-with-ruby-on-rails-4ffd8b851135

### v0.4:

- Handling SMS messages send to number +33644603615
- By following https://www.twilio.com/docs/sms/quickstart/ruby, https://www.twilio.com/blog/2014/02/twilio-on-rails-integrating-twilio-with-your-rails-4-app.html & https://www.twilio.com/blog/2013/10/test-your-webhooks-locally-with-ngrok.html

### v0.5:

- Web server should handle a cron logic to reach users a week after their submission and know which training fit them
- We could think as re-implement the service using https://developers.facebook.com/docs/messenger-platform/getting-started/quick-start which https://glitch.com/edit/#!/boulder-chair as an example

### v0.6:

- Use Google Maps API to turn raw location data into geopositions, and use as a criteria of the decision tree

### v0.7:

- Retrieve MOOC profiles, and used their API to get, e.g. Open Classroom, Codecademy achievements

### v0.8:

- Use Pole Emploie API <https://www.emploi-store-dev.fr/portail-developpeur-cms/home/catalogue-des-api/documentation-des-api/api-retouralemploiformation-###%20v1.html>

### v0.9:

- Offer the ability to put directly in contact inside the chatbot the user and a staff people of the training organism of which the user is interested

### v1.0:

- Create a minimalist web admin interface for us to easily reach users filtered on accurate criteria, for example “users living in Paris AND unemployed”
- Write specs to define the way of an OF can have access to their current or past learners database : "for instance, which infos would we give or not to an OF about one or many alumnis ?"

### v1.1:

- Standardize the way of the OF alumni and feedback interview database can be associated : "Could an OF give us access to his alumni database and how it is interesting...?"

### v1.2:

- Implement a statistic decision three algorithm on our database 
  - Question : how many data ? bootstapping ?
- Use A/B testing to check the accuracy of the method comparing the static one

### v1.3:

- Optimization exploration using Random Forest/Bagging, Bosting, etc.
  - (the real machine learning stuff, could be fun to understand)

### v1.4:

- Randomize questions order to add learning noise

### v1.5:

- Implement adaptive tests (like Akhenator) to find the most accurate questions order

### v1.6:

- Try more complex learning approches using https://lobe.ai/

### v1.7:

- Integrate Apple Business Chat https://developer.apple.com/business-chat/



## Functionnal Specifications

_~> https://github.com/3615passtech/bip-bop-bip-bot/wiki/Functionnal-Specifications_

_~> Decisions tree : https://realtimeboard.com/app/board/o9J_kyqBsSE=/_  
