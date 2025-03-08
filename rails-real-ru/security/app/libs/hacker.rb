# frozen_string_literal: true

require 'open-uri'
require 'net/http'

class Hacker
  class << self
    def hack(email, password)
      sign_up_url = 'https://rails-collective-blog-ru.hexlet.app/users/sign_up/'
      sign_up_uri = URI.parse(sign_up_url)

      http = Net::HTTP.new(sign_up_uri.host, sign_up_uri.port)
      http.use_ssl = true if sign_up_uri.scheme == 'https'

      request = Net::HTTP::Get.new(sign_up_uri.request_uri)
      response = http.request(request)

      html_parsed = Nokogiri::HTML(response.body)
      csrf_token = html_parsed.at_css('head meta[name=csrf-token]')['value']

      cookies = response.get_fields('set-cookie').join('; ')

      puts "CSRF Token: #{csrf_token}"
      puts "Cookies: #{cookies}"

      post_url = 'https://rails-collective-blog-ru.hexlet.app/users'
      post_uri = URI.parse(post_url)
      params = {
        authenticity_token: csrf_token,
        user_email: email,
        user_password: password,
        user_password_confirmation: password
      }

      http = Net::HTTP.new(post_uri.host, post_uri.port)
      http.use_ssl = true if post_uri.scheme == 'https'

      request = Net::HTTP::Post.new(post_uri.request_uri)
      request.set_form_data(params)

      request['cookie'] = cookies

      response = http.request(request)
      puts response
    end
  end
end
