require "action_mailer_config/version"
require "action_mailer"

module ActionMailerConfig
  module_function
  def load(config)
    config = symbolize_keys(config)
    ActionMailer::Base.instance_eval do
      case self.delivery_method = (config.delete(:delivery_method) || :test).to_sym
      when :smtp
        self.smtp_settings = config
      when :sendmail
        self.sendmail_settings = config
      when :file
        self.file_settings = config
      when :letter_opener
        unless ActionMailer::Base.delivery_methods[:letter_opener]
          require "letter_opener"
          ActionMailer::Base.add_delivery_method(
            :letter_opener,
            LetterOpener::DeliveryMethod,
            location: config[:location] || File.expand_path('../tmp/letter_opener', __FILE__)
          )
        end
      when :mailcatcher
        self.delivery_method = :smtp
        self.smtp_settings = {
          port: 1025
        }.merge(config)
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
