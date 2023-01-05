require 'minitest/autorun'
require 'rack/test'
require 'pry'

require_relative "../time_track_recode"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def admin_session
    { 'rack.session' => { username: "admin" } }
  end

  def session
    last_request.env["rack.session"]
  end

  def test_index
    get '/'
    get '/all_records'
    get '/login'
    assert_equal 200, last_response.status
  end

  def test_index_as_signed_in_user
    get '/',{}, admin_session
    assert_equal 200, last_response.status
  end

  def test_signin_with_bad_credentials
    post '/users/login', username: "guest", password: "secret"
    assert_equal 422, last_response.status
    assert_includes "Try again", last_response.body
  end

  def test_signin_with_good_credentials
    post '/users/login', username: "admin", password: "123456"
    assert_equal 302, last_response.status
  end
end