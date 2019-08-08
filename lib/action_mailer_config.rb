require "action_mailer_config/version"
require "action_mailer"

module ActionMailerConfig
  module_function
  def load(config)
    config = symbolize_keys(config)
    delivery_method = (config.delete(:delivery_method) || :test).to_sym

    if (default = config.delete(:default))
      ActionMailer::Base.default(default)
    end

    if defined?(Rails)
      Rails.application.config.action_mailer.delivery_method = delivery_method
      config.each do |attribute, value|
        Rails.application.config.action_mailer.send("#{attribute}=", value)
      end
    else
      ActionMailer::Base.instance_eval do
        self.delivery_method = delivery_method
        config.each do |attribute, value|
          send("#{attribute}=", value)
        end
      end
    end
  end

  # for actionmailer 4
  def symbolize_keys(obj)
    case obj
    when Hash
      obj.inject({}) do |new_hash, (k, v)|
        new_hash[k.to_sym] = symbolize_keys(v)
        new_hash
      end
    when Array
      obj.map{|e| symbolize_keys(e) }
    else
      obj
    end
  end
end
