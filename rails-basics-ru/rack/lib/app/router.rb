# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    request = Rack::Request.new(env)
    case request.path
    when '/', '/about'
      [200, {}, ['Success']]
    else
      [404, {}, ['Not found']]
    end
  end
end
