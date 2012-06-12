require "action_mailer"
module ActionMailerConfig
  module_function
  def load(config)
    config = config.symbolize_keys
    ActionMailer::Base.instance_eval do
      case self.delivery_method = (config.delete(:delivery_method) || :test).to_sym
      when :smtp
        self.smtp_settings = config
      when :sendmail
        self.sendmail_settings = config
      when :mailcatcher
        self.delivery_method = :smtp
        self.smtp_settings = {
          port: 1025
        }.merge(config)
      end
    end
  end
end
