require "action_mailer_config"
require "yaml"

path = "#{Rails.root}/config/mail.yml"

config = if File.exists? path
  config_for_all = YAML.load_file(path)

  if config_for_all.has_key? Rails.env
    config_for_all[Rails.env]
  else
    warn "Could not found ActionMailer config for #{Rails.env.inspect}, use delivery_method: test"
    {}
  end
else
  warn "Could not found ActionMailer config file: #{path}, use delivery_method: test"
  {}
end

if default_url_options = config.delete(:default_url_options) || config.delete("default_url_options")
  Rails.application.config.action_mailer.default_url_options = ActionMailerConfig.symbolize_keys(default_url_options)
end

ActionMailerConfig.load config
