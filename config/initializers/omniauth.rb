Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, '75xdpfcf3pxg2l', 'zHvDFfOuvoSCMXG0', :scope => 'r_fullprofile r_basicprofile r_emailaddress r_network rw_groups r_contactinfo', :fields => ['id', 'email-address', 'first-name', 'last-name', 'picture-url', 'connections', 'location', 'headline', 'industry', 'positions']
end