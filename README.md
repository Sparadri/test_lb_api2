

## TO BE CHECKED / IMPROVED
* store website API key application.yml and manage accessibility
* sorting to be challenged


## TO DO

#### Ruby / Rails
* protect_from_forgery rationale and potential implementation (?)
* add statuses error > 400, 302
* add other models
* add picture uploader
* algolia search
* money-rails
* stabilize gem versions before prod
* for interview, only do with placement (1, 2, 3)
* emailing (transactional and marketing) > user gibbon to automate newsletters?
* clearance gem for sign in
* create cloudinary account for lb
* https registration
* jobs to post on facebook / instagram / ...
* replace User.all.first by User.first
* heroku setup of sidekiq
* change is_logged_in policy to admin
* proted sidekiq route

#### SOCIAL
* add newsletter database (vs. managed by mailchimp?)
* ajax in mailchimp for surveys
* update newsletter preferences > receive monthly
* Cerberus newsletters

#### React / Redux
* friendly url name on redux
* add statuses error > 400, 302
* add picture uploader
* connect to GA
* add product_id as class ID to scroll until the product when coming from NL or instagram
* image uploader AWS (to be persisted ruby server side) react-s3 or other


## IN PROGRESS
* build react props
* paginate > rails: kaminari or will_paginate?
* how to stop infinite scroll?
* add number of products per category on product index + categories display should not be taking into account paginate?
* should order categories on products page by number of product in each category
* in products, add a category and a collectioner block
* add in devise whether user is admin or not
* add DESTROY method for all classes
* should we provide a collectioner to le_barda team members
* where to store collectioner profile_picture? in collection?
* what should be the process for creating interviews


## THINKING
* should we add profession? sportif, blogger, etc..
* collection, when live, should update product status to live. and vice versa. product_live and collection_not_live relationship should not be possible.
* names should all be downcased when persisted in database and then upcased manually?
* male / female filter
* country flags
* welcome email should be sent X minutes / hours after sign up


## ISSUES
* in application.rb, autoload_paths was added to load new folder 'services' (services folder was created by me): not sure best pratice...


## KNOWLEDGE

### BACKGROUND JOBS
* for tasks that take to much time in controllers (posting to an API (slack, etc...), sending emails, ...)
* enable to asynchronous code
* 2 waiting lists: normal and prio for things that must go fast
* CRON jobs > notion of scheduling
* 1 task, 1 job
* sikeq executed in model so has full access
* redis: key/value store > like postgresql. big hash that stores key/value pairs, not in ruby program but in redis





















