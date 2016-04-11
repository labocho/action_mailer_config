require "action_mailer_config/version"
require "action_mailer"

module ActionMailerConfig
  module_function
  def load(config)
    config = symbolize_keys(config)
    ActionMailer::Base.instance_eval do
      self.delivery_method = (config.delete(:delivery_method) || :test).to_sym
      config.each do |attribute, value|
        send("#{attribute}=", value)
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
