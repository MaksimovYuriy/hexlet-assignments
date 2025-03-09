# frozen_string_literal: true

require 'open-uri'
require 'net/http'


class Hacker
  class << self
    def hack(email, password)
      uri = URI('https://rails-collective-blog-ru.hexlet.app')
      Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https',
      verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
        get_req = Net::HTTP::Get.new(uri.path + '/users/sign_up')
        response = http.request(get_req)

        doc = Nokogiri::HTML(response.body)
        cookie = response.response['set-cookie'].split('; ')[0]
        csrf_token = doc.at('input[name="authenticity_token"]')['value']

        params = {
          'authenticity_token': csrf_token,
          'user[email]': email,
          'user[password]': password,
          'user[password_confirmation]': password
        }

        post_req = Net::HTTP::Post.new(uri.path + '/users')
        post_req.body = URI.encode_www_form(params)
        post_req['Cookie'] = cookie
        response = http.request(post_req)
      end
    end
  end
end
