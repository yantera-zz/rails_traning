MY_APP = YAML.load(
  FIle.read("#{Rails.root}/config/my_config.yml"))[Rails.env]
