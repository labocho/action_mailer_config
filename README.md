# action_mailer_config


## Installation

Add this line to your application's Gemfile:

    gem 'action_mailer_config', '~> 2.0'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install action_mailer_config


## Usage

    require "action_mailer_config"
    ActionMailerConfig.load(
      delivery_method: "smtp",
      smtp_settings: {
        port: 1234
      }
    )

for Rails, please make config/mail.yml like below.

    development:
      delivery_method: letter_opener

    test:
      delivery_method: test

    production:
      delivery_method: smtp
      smtp_settings:
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


## Contributing

1. Fork it ( http://github.com/labocho/action_mailer_config/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

