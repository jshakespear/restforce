module Restforce

  # Piece of middleware that simply injects the OAuth token into the request
  # headers.
  class Middleware::Authorization < Restforce::Middleware
    AUTH_HEADER = 'Authorization'.freeze

    def call(env)
      if(token)
        env[:request_headers][AUTH_HEADER] = %(OAuth #{token})
      elsif(session_id)
        env[:request_headers][AUTH_HEADER] = %(OAuth #{session_id})
      end
      @app.call(env)
    end

    def session_id
      @options[:session_id]
    end

    def token
      @options[:oauth_token]
    end

  end

end