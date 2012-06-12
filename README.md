# action_mailer_config

## Usage

    require "action_mailer_config"
    ActionMailerConfig.load(
      delivery_method: "smtp",
      port: 1234
    )

for Rails

    # config/initializer/application.rb
    module YourApplication
      class Application < Rails::Application
        # ...
        require "action_mailer_config/rails"
      end
    end

## Contributing to action_mailer_config

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 labocho. See LICENSE.txt for
further details.

