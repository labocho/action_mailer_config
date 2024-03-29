require "action_mailer_config"
require "yaml"

path = "#{Rails.root}/config/mail.yml"

config = if File.exist? path
  yaml = ERB.new(File.read(path), trim_mode: "-").result
  config_for_all = YAML.load(yaml, aliases: true)

  if config_for_all.key? Rails.env
    config_for_all[Rails.env]
  else
    warn "Could not found ActionMailer config for #{Rails.env.inspect}, use delivery_method: test"
    {}
  end
else
  warn "Could not found ActionMailer config file: #{path}, use delivery_method: test"
  {}
end

ActionMailerConfig.load config
