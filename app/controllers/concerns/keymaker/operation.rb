module Keymaker

  class Operation
    
    attr_accessor :url, :client_id, :client_secret

    def initialize( params={} )
      self.url = params[ :url ]
      self.client_id = params[ :client_id ]
      self.client_secret = params[ :client_secret ]
    end

    def get( path, parameters={} )
      request( path, parameters, Net::HTTP::Get )
    end

    def post( path, parameters={} )
      request( path, parameters, Net::HTTP::Post )
    end  

    def request( path, parameters, operator )
      
      uri = URI( url + path )
      body = URI.encode_www_form( authenticated_params.merge( parameters ) )

      operation = operator.new( uri )

      operation.body = body

      result = nil

      response = Net::HTTP.start( uri.hostname, uri.port ) do |http|
        http.request( operation )
      end

      #check response and set result if valid
      if response &&
            response.is_a?( Net::HTTPSuccess ) &&
            response.body.present?
        result = JSON.parse( response.body )
      end

      result
    end
    def access_token
      @access_token ||= Unimatrix::Authorization::ClientCredentialsGrant.new(
        client_id: ENV[ 'KEYMAKER_CLIENT' ],
        client_secret: ENV[ 'KEYMAKER_SECRET' ]
      ).request_token
    end

    def authenticated_params
      { access_token: access_token }
    end

  end

end