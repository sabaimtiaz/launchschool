require 'sinatra'
require 'sinatra/content_for'
require 'tilt/erubis'
require 'sinatra/reloader' if development?
require 'redcarpet'

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
  erb :new
end

get '/users/signin' do
  erb :signin
end

post '/users/signin' do
  session[:username] = params[:username]
  @password = params[:password]
  error = params[:username] != "admin"|| params[:password] != "secret"
  if error
    session[:username] = params[:username]
    session[:error] = "Invalid credentials"
    status 422
    erb :signin
  elsif
    session[:success] = "Welcome!"
    redirect '/'
  end
end

post '/create' do
  filename = params[:filename].to_s
  if filename.size <= 1
    session[:error] = 'A name is required'
    status 422
    erb :new
  elsif File.extname(filename) == ""
    session[:error] = 'A file extension is required'
    status 422
    erb :new
  else
    file_path = File.join(data_path, filename)
    File.write(file_path, "")
    session[:message] = "#{filename} has been created."
    redirect '/'
  end
end

get '/:filename/edit' do
  file_path = File.join(data_path, params[:filename])
  @filename = params[:filename]
  @text = File.read(file_path)
  erb :edit
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path('../test/data', __FILE__)
  else 
    File.expand_path('../data', __FILE__) 
  end
end

post '/:filename/delete' do
  file_path = File.join(data_path, params[:filename])
  File.delete(file_path)
  session[:message] = "#{params[:filename]} has been deleted"
  redirect '/'
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
  else
    content
  end
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
  file_path = File.join(data_path, params[:filename])
  @text = File.write(file_path, params[:text])

  session[:message] = "#{params[:filename]} has been edited."
  redirect "/"
end

def error_file_path(path)
  !File.exist?(path)
 end
