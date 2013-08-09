module Restforce

  # Authentication middleware used if session_id is set
  class Middleware::Authentication::Session < Restforce::Middleware::Authentication

    def params
      { :grant_type    => 'password',
        :session_id => @options[:session_id] }
    end

  end

end