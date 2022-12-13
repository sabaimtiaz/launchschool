ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require 'pry'
require 'fileutils'

require_relative "../cms"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def admin_session
    { 'rack.session' => { username: "admin" } }
  end

  # def session
  #   last_request.env["rack.session"]
  # end

  def test_index_as_signed_in_user
    get '/',{}, admin_session
  end

  def setup
    FileUtils.mkdir_p(data_path)
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def session
    last_request.env["rack.session"]
  end

  def test_index
    create_document "about.md"
    create_document "changes.txt"
    create_document "history.txt"

    get "/"
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "changes.txt"
  end

  # def test_about
  #   get "/about.md"
  #   assert_equal 200, last_response.status
  # end

  # def test_changes
  #   get "/changes.txt"
  #   assert_equal 200, last_response.status
  # end

  # def test_history
  #   get "/history.txt"
  #   assert_equal 200, last_response.status
  # end

  # def test_content
  #   get "/history.txt"
  #   text = "1993 - Yukihiro Matsumoto dreams up Ruby"
  #   history = last_response.body
  #   assert_equal text, history.split(".")[0]
  # end

  def test_view_new_doc
    get '/new', {}, admin_session
    assert_equal 200, last_response.status
 #   assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<input "
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_create_new_doc
    post '/create', {filename: "testing.txt"}, admin_session
    assert_equal 302, last_response.status

    get last_response["Location"]
    assert_includes last_response.body, "testing.txt has been created."
  end

  def test_create_new_doc_signed_out
    post '/create', { filenam: 'test.txt' }
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_no_filename_error
    post '/create', {filename: " "}, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, "A name is required"
  end

  def test_viewing_text
    create_document "history.txt", "Ruby 0.95 released"

    get "/history.txt"
    
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "Ruby 0.95 released"
  end

  def test_error
    file_name = "h.txt"
    get "/#{file_name}"
    
    assert_equal 302, last_response.status
    
    get last_response["Location"]
    assert_equal 200, last_response.status
    
    assert_includes last_response.body, "#{file_name} does not exist"
  end

  def test_markdown
    create_document "about.md", "<h1>This is an about page</h1>\n"

    get "/about.md"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<h1>This is an about page</h1>"
  end

  def test_edit
    create_document "changes.txt"

    get '/changes.txt/edit', {}, admin_session
    assert_equal 200, last_response.status
    assert_includes last_response.body, "<textarea"
    assert_includes last_response.body, "<button type=\"submit\""
  end

  def test_editing_signed_out
    create_document 'changes.txt'
    get '/changes.txt/edit'
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_delete
    create_document "testing.txt"
    post "/testing.txt/delete", {}, admin_session
    assert_equal 302, last_response.status

    get last_response["Location"]
    assert_includes last_response.body, "testing.txt has been deleted"

    get '/'
    refute_includes last_response.body, "testing.txt"
  end

  def test_delete_signed_out
    create_document "testing.txt"
    post "/testing.txt/delete"
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_updating_document
    post "/changes.txt", {text: "new idea!"}, admin_session
    assert_equal 302, last_response.status
    assert_equal "changes.txt has been edited.", session[:message]

    get '/changes.txt'
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new idea!"
  end

  def test_updating_doc_signed_out
    post "/changes.txt", {text: "new idea!"} 
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def create_document(name, content = "")
    File.open(File.join(data_path, name), "w") do |file|
      file.write(content)
    end
  end

  def test_signin_form
    get '/users/signin'
    assert_equal 200, last_response.status
  end

  def test_signin_with_bad_credentials
    post '/users/signin', username: "guest", password: "secret"
    assert_equal 422, last_response.status
    assert_includes last_response.body, "Invalid credentials"
  end

  def test_signin
    post '/users/signin', username: "admin", password: "secret"
    assert_equal 302, last_response.status
    assert_includes " signed in ", last_response.body
  end

  def test_signout
    get '/signout'
    assert_equal 302, last_response.status
    assert_includes "You have been signed out", last_response.body
  end
end