require "action_mailer_config"
require "yaml"

path = "#{Rails.root}/config/mail.yml"
raise "Could not found ActionMailer config file: #{path}" unless File.exists? path
config_for_all = YAML.load_file(path)
raise "Could not found ActionMailer config for #{Raile.env.inspect}" unless config_for_all.has_key? Rails.env
ActionMailerConfig.load config_for_all(Rails.env)
