require 'sinatra'
require 'sinatra/content_for'
require 'tilt/erubis'
require 'sinatra/reloader' if development?
require 'redcarpet'
require 'yaml'
require 'bcrypt'
require 'fileutils'

configure do 
  enable :sessions
  set :session_secret, 'super secret'
end

get '/' do
  pattern = File.join(data_path,"*")
  @contents = Dir.glob(pattern).map do |path|
    File.basename(path)
  end
  erb :index, layout: :layout
end

get '/signout' do
  session.delete(:username)
  session[:message] = "You have been signed out."
  redirect '/'
end

get '/new' do
  require_sign_in

  erb :new
end

get '/users/signin' do
  erb :signin
end

def load_users
  users_path = if env["RACK_ENV"] == 'test'
    File.expand_path("../users.yml", __FILE__)
  else
    File.expand_path('../users.yml', __FILE__)
  end
  YAML.load_file(users_path)
end

post '/users/signin' do
  username = params[:username]
  credentials = load_users
  if is_password_encrypted?(username, params[:password])
    session[:username] = params[:username]
    session[:success] = 'Welcome!'
    redirect '/'
  else 
    session[:error] = "Invalid credentials"
    status 422
    erb :signin
  end
end

def is_password_encrypted?(username, password)
  credentials = load_users 
  if credentials.key?(username)
    bcrypt_password = BCrypt::Password.new(credentials[username]) 
    bcrypt_password == password
  else
    false
  end
end

post '/create' do
  require_sign_in
  filename = params[:filename].to_s
  file_path = File.join(data_path, filename)
  if !is_extension_valid?(File.extname(file_path))
    session[:error] = 'The extension is not valid'
    status 422
    erb :new
  elsif
    filename.size <= 1
    session[:error] = 'A name is required'
    status 422
    erb :new
  else
    File.write(file_path, "")
    session[:message] = "#{filename} has been created."
    redirect '/'
  end
end

get '/:filename/edit' do
  require_sign_in
  file_path = File.join(data_path, params[:filename])
  @filename = params[:filename]
  @text = File.read(file_path)
  erb :edit
end

post '/:filename/duplicate' do
  file_path = File.join(data_path, params[:filename])
  new_path = File.join(data_path, "#{params[:filename]}-copy")
  File.write(new_path, " ")
  FileUtils.cp(file_path, new_path)  
  session[:message] = "#{params[:filename]} has been duplicated."
  redirect '/'
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path('../test/data', __FILE__)
  else 
    File.expand_path('../data', __FILE__) 
  end
end

post '/:filename/delete' do
  require_sign_in
  file_path = File.join(data_path, params[:filename])
  File.delete(file_path)
  session[:message] = "#{params[:filename]} has been deleted"
  redirect '/'
end

def user_signed_in?
  credentials = load_users
  credentials.key?(params[:username]) 
end

def require_sign_in
  unless user_signed_in?
    session[:message] = "You must be signed in to do that."
    redirect '/'
  end
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def view_file_content(path)
  content = File.read(path)

  case File.extname(path)
  when ".txt"
    headers["Content-Type"] = "text/plain"
    content
  when ".md"
    erb render_markdown(content)
  end
end

get '/view' do
  file_path = File.join(data_path, File.basename(params[:filename]))

  if File.exist?(file_path)
    view_file_content(file_path)
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect '/'
  end
end


def is_extension_valid?(ext)
  [".pdf", ".txt", ".docx", ".pages"].include?(ext)
end

get '/:filename' do 
  file_path = File.join(data_path, params[:filename])
  if error_file_path(file_path)
    session[:error] = "#{params[:filename]} does not exist."
    redirect "/"
  else
    view_file_content(file_path)
  end
end

post '/:filename' do
  require_sign_in
  file_path = File.join(data_path, params[:filename])
  @text = File.write(file_path, params[:text])

  session[:message] = "#{params[:filename]} has been edited."
  redirect "/"
end

def error_file_path(path)
  !File.exist?(path)
 end
