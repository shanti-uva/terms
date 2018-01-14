if !defined? APP_URI
  case InterfaceUtils::Server.environment
  when InterfaceUtils::Server::DEVELOPMENT
    APP_URI = "dev-terms.#{InterfaceUtils::Server.get_domain}"
  when InterfaceUtils::Server::STAGING
    APP_URI = "staging-terms.#{InterfaceUtils::Server.get_domain}"
  when InterfaceUtils::Server::PRODUCTION
    APP_URI = "terms.#{InterfaceUtils::Server.get_domain}"
  when InterfaceUtils::Server::LOCAL
    APP_URI = 'localhost/shanti/terms'
  else
    APP_URI = "terms.#{InterfaceUtils::Server.get_domain}"
  end
end