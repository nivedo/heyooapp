# JCONFIG.RB

# Blueprint Modules
@BLUEPRINTS = ["ancestry","carrierwave","params"]

@PARAMS = {
  :appname => "Heyoo",
  :generate_models => false,
  :skin => "heyoo",
  :logo => "HEYOO",
  :use_haml => true,
  :use_bourbon => true,
  :use_compass => false
}

@USER_OPTIONS = {
  :first_name => "string",
  :last_name => "string",
  :phone_number => "string",
  :unit_number => "string"
}

@CONTENT_OPTIONS = {
}

@CARRIERWAVE_OPTIONS = {
  :multiple => true
}
