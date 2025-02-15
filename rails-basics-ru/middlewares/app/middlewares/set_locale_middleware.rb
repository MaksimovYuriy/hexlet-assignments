# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    request = Rack::Request.new(env)
    if accept_language = extract_locale_header(request)
      I18n.locale = extract_locale_from_accept_language_header(accept_language)
    else
      I18n.locale = I18n.default_locale
    end

    @status, @headers, @response = @app.call(env)
    [@status, @headers, @response]
  end

  def extract_locale_header(request)
    request.env['HTTP_ACCEPT_LANGUAGE']
  end

  def extract_locale_from_accept_language_header(header)
    header.scan(/^[a-z]{2}/).first
  end
  # END
end
