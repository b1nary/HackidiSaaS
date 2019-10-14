[![Beerpay](https://img.shields.io/beerpay/b1nary/HackidiSaaS.svg?style=flat-square)](https://beerpay.io/b1nary/HackidiSaaS)
[![Travis](https://img.shields.io/travis/b1nary/HackidiSaaS.svg?style=flat-square)](https://travis-ci.org/b1nary/HackidiSaaS)
[![Code Climate](https://img.shields.io/codeclimate/github/b1nary/HackidiSaaS.svg?style=flat-square)](https://codeclimate.com/github/b1nary/HackidiSaaS)
[![Code Climate Coverage](https://img.shields.io/codeclimate/coverage/github/b1nary/HackidiSaaS.svg?style=flat-square)](https://codeclimate.com/github/b1nary/HackidiSaaS/coverage)
[![Code Climate Issues](https://img.shields.io/codeclimate/issues/github/b1nary/HackidiSaaS.svg?style=flat-square)](https://codeclimate.com/github/b1nary/HackidiSaaS/issues)
[![GitHub issues](https://img.shields.io/github/issues/b1nary/HackidiSaaS.svg?style=flat-square)](https://github.com/b1nary/HackidiSaaS/issues)
[![license](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://opensource.org/licenses/MIT)

# ![Hackidi](http://i.imgur.com/abczFrv.jpg) HackidiSaaS // DEPRECATED

A **Rails 5** starter template to ship your ~~projects~~ **SaaS** even faster.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

Shipped Features:

* build with [Rails 5](http://rubyonrails.org/) & [Bootstrap 4](https://github.com/twbs/bootstrap-sass)
* [Bootswatch](https://bootswatch.com/) themes
* [NProgress](http://ricostacruz.com/nprogress/) loading bars for Turbolinks
* User authentication through [Devise](https://github.com/plataformatec/devise) (Usernames patched)
* [bootstrap_form](https://github.com/bootstrap-ruby/rails-bootstrap-forms) for easy bootstrap conform forms.
* [font-awesome-rails](https://github.com/bokmann/font-awesome-rails) for some easy icons.
* [data-confirm-modal](https://github.com/ifad/data-confirm-modal) for some bootstrapy confirm dialogs
* [slack-notifier](https://github.com/stevenosloan/slack-notifier) for slack based notifications
* [rails_admin](https://github.com/sferik/rails_admin) CRUD admin interface

### Rename the application

After cloning you most likely want to rename the application, this is why we included [rename](https://github.com/morshedalam/rename)

Simply go in the directory and type:

    rails g rename:app_to YourName

### Things to do after that:

- [ ] Change public/login.jpg (Seen on login/registration pages)
- [ ] Setup slack notification webhook in `config/initializers/slack_notifier.rb`
- [ ] Add your Impressum & Privacy Policy

### Roadmap

- [ ] Implement Stripe
- [ ] Implement Paypal
- [ ] Implement some Bitcoin based payment

### Free to use

The app is completely free, but i am and will put a lot of work into it so any motivational funds are appreciated.

[![Beerpay](https://beerpay.io/b1nary/HackidiSaaS/badge.svg?style=beer)](https://beerpay.io/b1nary/HackidiSaaS)
