# action_mailer_config


## Installation

Add this line to your application's Gemfile:

    gem 'action_mailer_config'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install action_mailer_config


## Usage

    require "action_mailer_config"
    ActionMailerConfig.load(
      delivery_method: "smtp",
      port: 1234
    )

for Rails, please make config/mail.yml like below.

    development:
      delivery_method: mailcatcher

    test:
      delivery_method: test

    production:
      delivery_method: smtp
      # smtp_settings
      address: mail.example.com
      user_name: noreply@example.com
      password: xxxxxx

and add `require "action_mailer_config/rails"` to config/application.rb.

    # config/initializer/application.rb
    module YourApplication
      class Application < Rails::Application
        # ...
        require "action_mailer_config/rails"
      end
    end


## Delivery method

`smtp`, `sendmail`, `file`, `test`, `letter_opener` or `mailcatcher` are available.
letter_opener requires letter_opener gem (http://rubygems.org/gems/letter_opener).
mailcatcher requires mailcatcher gem (http://rubygems.org/gems/mailcatcher) and run command `mailcatcher`.

## Contributing

1. Fork it ( http://github.com/labocho/action_mailer_config/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

