require 'json'
require 'byebug'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    cookies = req.cookies['_rails_lite_app']
    # byebug
    if cookies
      @cookie = JSON.parse(cookies)
    else
      @cookie = Hash.new
    end
  end

  def [](key)
    # p 'accessing cookie'
    @cookie[key]
  end

  def []=(key, val)
    # p 'writing cookie ivar'
    @cookie[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    return if @cookie == {}
    cookie_attributes = { path: '/', value: @cookie.to_json }
    res.set_cookie('_rails_lite_app', cookie_attributes)
  end
end
