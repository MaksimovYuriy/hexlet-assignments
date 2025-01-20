# frozen_string_literal: true

# BEGIN

require 'forwardable'

class Url
  attr_accessor :url

  extend Forwardable

  def_delegators :@url, :index, :split, :[]

  include Comparable

  def ==(other)
    self_scheme = scheme
    self_host = host
    self_port = port
    self_params = query_params
    other_scheme = other.scheme
    other_host = other.host
    other_port = other.port
    other_params = other.query_params

    self_scheme == other_scheme &&
    self_host == other_host &&
    self_port == other_port &&
    self_params == other_params
  end

  def initialize(url)
    @url = url
  end

  def scheme
    url[..url.index(':') - 1]
  end

  def host
    ind = url.index('?')
    url_host = ""
    if ind.nil?
      url_host = url[(url.index(':') + 3)..(url.index('?'))]
    else
      url_host = url[(url.index(':') + 3)..(url.index('?') - 1)]
    end
    if port.empty?
      url_host
    else
      url_host[0..(url_host.index(':') - 1)]
    end
  end

  def port
    first_ind = url.index(':')
    second_ind = url.index(':', first_ind + 1)
    if second_ind.nil?
      ''
    else
      url[(second_ind + 1)..(url.index('?') - 1)]
    end
  end

  def query_params
    ind = url.index('?')
    if ind.nil?
      str_params = ''
    else
      str_params = url[(url.index('?') + 1)..]
    end

    key_value = str_params.split('&')
    result_hash = {}
    key_value.each do |pair|
      param = pair.split('=')
      result_hash[param[0].to_sym] = param[1]
    end

    result_hash
  end

  def query_param(key, default = nil)
    params = query_params
    params.fetch(key.to_sym, default)
  end
end

# END
